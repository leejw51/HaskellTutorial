module Main  where
import           Control.Monad
import           Control.DeepSeq
import           Control.Parallel
import           Control.Applicative
import           Data.Foldable
import qualified Data.ByteString.Char8         as C
import qualified Data.ByteString.Base16        as H
import qualified Crypto.Hash.SHA256            as S


chars :: String
chars = "0123456789\0"
byteChars :: [C.ByteString]
byteChars =  C.pack . (: []) <$> chars

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
  let target_user = "03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4"
  let (target,_) = H.decode $ C.pack target_user
  let found =head $foldl' (<|>) empty $   runsparks  hacking myworks target
  let found2= C.unpack found
  let found3 = removeblank found2
  putStr "found=" >> putStr found3

removeblank xs = [ x | x <- xs, not (x `elem` "\0") ]

runsparks _  []    _   = []
runsparks f  (x : xs) target = par y (pseq ys  (y : ys)) where
  y  = force $ f x target
  ys = runsparks f  xs target
