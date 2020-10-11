module Examples.Hacking where
import           Control.Concurrent (setNumCapabilities)
import qualified Crypto.Hash.SHA256 as SHA256
import           Control.Monad      (replicateM, join, (>=>))
import           Control.Monad.Par  (runPar, get, spawnP)
import           Data.ByteString    (pack)
import           Data.List.Split    (chunksOf)
import           GHC.Conc           (getNumProcessors)
import           Text.Printf        (printf)
import qualified Data.ByteString.Char8 as BS
import qualified Data.ByteString.Base16 as B16
import qualified Data.ByteString.Char8 as BS2
import Control.Parallel





main = do
  --let a=replicateM 2 [0..9]
  let a= [1..100]
  let b =foldl (\acc x -> acc+x) 0 a
  print b

countFibonnaciNumber :: Int -> Int
countFibonnaciNumber number | number <= 1 = 1
  | otherwise = par number1 (pseq number2 (number1 + number2 + 1))
    where  
      number1 = countFibonnaciNumber (number-1)
      number2 = countFibonnaciNumber (number-2)

main2= do
  let a= countFibonnaciNumber 80
  print a