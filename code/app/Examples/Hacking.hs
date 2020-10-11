module Examples.Hacking where
import           Control.Concurrent (setNumCapabilities)
import qualified Crypto.Hash.SHA256 as SHA256
import           Control.Monad      (replicateM, join, (>=>))
import           Control.Monad.Par  (runPar, get, spawnP)
import           Data.ByteString    (pack)
import           Data.List.Split    (chunksOf)
import           GHC.Conc           (getNumProcessors)
import           Text.Printf        (printf)
import           Control.DeepSeq
import qualified Data.ByteString.Char8 as BS
import qualified Data.ByteString.Base16 as B16
import qualified Data.ByteString.Char8 as BS2
import Control.Parallel
import           Data.Foldable
import Control.Applicative
import Control.Monad

chars=['0'..'9']
(target,_)=  B16.decode $ BS2.pack "ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f"
myprefix= replicateM 3 chars

-- prefix: to distribute sparks
mycompute2 prefix= do
  a <- chars
  b <- chars
  c <- chars
  d <- chars
  e <- chars
  let src=prefix++[a,b,c,d,e]
  let hash= SHA256.hash . BS2.pack $ src 
  guard (target == hash)
  return src

main = do
  let found =foldl' (<|>) empty $   mycompute2 <%> myprefix
  print found


f <%> []       = []
f <%> (x : xs) = y `par` ys `pseq` (y : ys) where
  y  = force $ f x
  ys = f <%> xs
