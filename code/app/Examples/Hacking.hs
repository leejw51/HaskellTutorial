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
(target,_)=  B16.decode $ BS2.pack "03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4"
mycompute2 prefix= do
  a <- chars
  b <- chars
  c <- chars
  d <- chars
  let src=[a,b,c,d]
  let hash= SHA256.hash . BS2.pack $ src 
  guard (target == hash)
  return src

main = do
  let found =foldl' (<|>) empty $   mycompute2 []
  print found


f <%> []       = []
f <%> (x : xs) = y `par` ys `pseq` (y : ys) where
  y  = force $ f x
  ys = f <%> xs
