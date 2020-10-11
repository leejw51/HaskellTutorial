
module Main  where
import Control.Monad ( guard, replicateM )
import           Control.DeepSeq
import           Control.Parallel
import           Control.Applicative
import           Data.Foldable
import qualified Data.ByteString.Char8         as C
import qualified Data.ByteString.Base16        as H
import qualified Data.ByteString as B
import qualified Crypto.Hash.SHA256            as S
import qualified Data.HexString as H2
import Numeric (showHex)
chars :: String
chars = "0123456789\0"
byteChars :: [C.ByteString]
byteChars =  C.pack . (: []) <$> chars
prettyPrint = concat . map (flip showHex "") . B.unpack
bytePrefixes :: Int -> String -> [C.ByteString]
bytePrefixes numPrefix chars = C.pack <$> replicateM numPrefix chars

myworks=bytePrefixes 3 chars

hacking :: C.ByteString -> C.ByteString -> [C.ByteString]
-- prefix: to distribute sparks, this is for multi threading
-- without prefix: onely single threaded
-- with too many prefix: then too many sparks, system down
hacking workloads target= do
  a <- byteChars
  b <- byteChars
  c <- byteChars
  d <- byteChars
  e <- byteChars
  let src = foldl (<>) mempty [workloads, a, b, c, d, e]
  let src2=  C.pack $ removeblank $ C.unpack src
  let hash= S.hash src2 
  guard (target == hash)
  return src


main= do
  putStrLn "enter string(only digits up to 8)="
  target_user <- getLine
  let target= S.hash $ C.pack target_user
  putStrLn "hash="
  print $ prettyPrint target
  let found =head $foldl' (<|>) empty $   runsparks  hacking myworks target
  let found2= C.unpack found
  let found3 = removeblank found2
  putStr "found=" >> putStr found3

removeblank xs = [ x | x <- xs, not (x `elem` "\0") ]

runsparks _  []    _   = []
runsparks f  (x : xs) target = par y (pseq ys  (y : ys)) where
  y  = force $ f x target
  ys = runsparks f  xs target
