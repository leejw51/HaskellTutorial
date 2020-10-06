module Examples.Hacking where

import Control.Exception                                                                                                                
import System.Environment                                                                                                               
import Data.Maybe                                                                                                                       
import Control.Monad.Par
                                                                                                                

mysolve:: Int -> Maybe Int
mysolve a = return (a*100)                                                                                                                                        
main = do                                                                                                                               
  let grids= [1..10]
  print (length (filter isJust (runPar $ parMap mysolve grids)))                                                                 
