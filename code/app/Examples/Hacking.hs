module Examples.Hacking where

import Control.Exception                                                                                                                
import System.Environment                                                                                                               
import Data.Maybe                                                                                                                       
import Control.Monad.Par
                                                                                                                

mysolve:: Int -> Maybe Int
mysolve a = do
  if a<5 
    then return (a*100)                                                                                                                                        
    else Nothing
    
main = do                                                                                                                               
  let grids= [1..10]
  let b=filter isJust (runPar $ parMap mysolve grids)
  print b
  print "OK"                                  
