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
byteChars = C.pack . (: []) <$> chars


bytePrefixes :: Int -> String -> [C.ByteString]
bytePrefixes numPrefix chars = C.pack <$> replicateM numPrefix chars

(target,_)=  H.decode $ C.pack "ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f"
myprefix=bytePrefixes 3 chars



mycompute2 :: C.ByteString -> [C.ByteString]
-- prefix: to distribute sparks
mycompute2 prefix= do
  a <- byteChars
  b <- byteChars
  c <- byteChars
  d <- byteChars
  e <- byteChars
  let src = foldl' (<>) mempty [prefix, a, b, c, d, e]
  let hash= S.hash src 
  guard (target == hash)
  return src

main = do
  let found =head $foldl' (<|>) empty $   mycompute2 <%> myprefix
  let found2= C.unpack found
  print found2



(<%>) :: (NFData a, NFData b) => (a -> b) -> [a] -> [b]
f <%> []       = []
f <%> (x : xs) = y `par` ys `pseq` (y : ys) where
  y  = force $ f x
  ys = f <%> xs
