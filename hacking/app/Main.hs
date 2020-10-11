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

--(target,_)=  H.decode $ C.pack "03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4"
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
  let src2=  C.pack $ removeblank $ C.unpack src
  let hash= S.hash src2 
  guard (target == hash)
  return src

main= do
  let found =head $foldl' (<|>) empty $   runsparks  hacking myprefix
  let found2= C.unpack found
  let found3 = removeblank found2
  print found3

removeblank xs = [ x | x <- xs, not (x `elem` "\0") ]

main2 :: IO ()
main2= do
    let a= "1020\0\0\0"
    let b= removeblank a
    print b

runsparks :: NFData a1 => (a2 -> a1) -> [a2] -> [a1]
runsparks f []       = []
runsparks f  (x : xs) = par y (pseq ys  (y : ys)) where
  y  = force $ f x
  ys = runsparks f  xs
