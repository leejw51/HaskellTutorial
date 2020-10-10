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


   
bruteForce :: Int -> BS.ByteString -> [(String, String)]
bruteForce n hashedValues = runPar $ join <$> 
  (mapM (spawnP . foldr findMatch []) >=> mapM get) chunks
  where
    chunks = chunksOf (10^8 `div` n) $ replicateM 8  ['0'..'9']
    findMatch s accum
      | hashed  == hashedValues = (show hashed, show s) : accum
      | otherwise = accum
      where
        --bStr = pack s
        hashed =(SHA256.hash. BS.pack)  s
 

main = do
  cpus <- getNumProcessors
  setNumCapabilities cpus
  printf "Using %d cores\n" cpus
  b <- getLine
  putStrLn "You Enter=  " >> putStrLn b
  let (c,_)=  B16.decode $ BS2.pack b
  let mc= bruteForce  cpus c 
  print(mc)