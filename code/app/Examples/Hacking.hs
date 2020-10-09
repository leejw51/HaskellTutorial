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

main = do
  putStrLn "Hacking"
  let c= replicateM 4 [0..9]
  let b= mycompute <%> c
  let found= foldl (<|>) empty b
  print found
  print "OK"
  
mysum xs= foldl (\acc x -> acc+x) 0 xs

mycompute:: [Int] -> Maybe [Int]
mycompute a=  do
  let b= sum a 
  if b==10 
    then Just a
    else Nothing

f <%> []       = []
f <%> (x : xs) = y `par` ys `pseq` (y : ys) where
  y  = force $ f x
  ys = f <%> xs