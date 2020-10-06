module Examples.Hacking where

import Control.Exception                                                                                                                
import System.Environment                                                                                                               
import Data.Maybe                                                                                                                       
import Control.Monad.Par
import Control.Monad                                                                                                                
import Data.Foldable

mysolve:: Int -> Maybe Int
mysolve a = do
  if a>5 
    then return (a*100)                                                                                                                                        
    else Nothing
    
main = do                                                                                                                               
  let grids= [1..10]
  let b2= (runPar $ parMap mysolve grids)
  print b2
  let b=asum (runPar $ parMap mysolve grids)
  print b
  print "OK"                                  
