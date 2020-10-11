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
chars = "0123456789"
byteChars :: [C.ByteString]
byteChars =  C.pack . (: []) <$> chars

bytePrefixes :: Int -> String -> [C.ByteString]
bytePrefixes numPrefix chars = C.pack <$> replicateM numPrefix chars

(target,_)=  H.decode $ C.pack "ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f"
myprefix=bytePrefixes 3 chars



hacking :: C.ByteString -> [C.ByteString]
-- prefix: to distribute sparks, this is for multi threading
-- without prefix: onely single threaded
-- with too many prefix: then too many sparks, system down
hacking workloads= do
  a <- byteChars
  b <- byteChars
  c <- byteChars
  d <- byteChars
  e <- byteChars
  let src = foldl (<>) mempty [workloads, a, b, c, d, e]
  let hash= S.hash src 
  guard (target == hash)
  return src

main = do
  let found =head $foldl' (<|>) empty $   runsparks  hacking myprefix
  let found2= C.unpack found
  print found2



runsparks :: NFData a1 => (a2 -> a1) -> [a2] -> [a1]
runsparks f []       = []
runsparks f  (x : xs) = par y (pseq ys  (y : ys)) where
  y  = force $ f x
  ys = runsparks f  xs
