module Examples.Hacking where

import Control.Exception                                                                                                                
import System.Environment                                                                                                               
import Data.Maybe                                                                                                                       
import Control.Monad.Par
import Control.Monad                                                                                                                
import Data.Foldable
import Control.DeepSeq
import Control.Parallel
import Control.Applicative
import qualified Data.ByteString as BS
import qualified Data.ByteString.Base16 as B16
import qualified Data.ByteString.Char8 as BS2
import qualified Crypto.Hash.SHA256 as SHA256


main = do
  putStrLn "Hacking"
  let a= searchHash 
  print a

searchHash= found
  where
    (mc,_)=  B16.decode $ BS2.pack "ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f"
    chars=['0'..'9']
    c= replicateM 8 ['0'..'9']
    found= foldl' (<|>) empty (runPar <%> c)
    runPar = (mycompute mc) 


-- | Parallel map using deepseq, par and pseq
(<%>) :: (NFData a, NFData b) => (a -> b) -> [a] -> [b]
f <%> []       = []
f <%> (x : xs) = y `par` ys `pseq` (y : ys) where
  y  = force $ f x
  ys = f <%> xs



mycompute::  BS2.ByteString->[Char]-> Maybe [Char]
mycompute mc a=  do
  let b= (SHA256.hash . BS2.pack) a 
  if b==mc
    then Just a
    else Nothing

