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
  --let c= replicateM 6  [0..9]
  let chars=[0..9]
  let c =[[a,b,c,d ,e,f,g,h] | a<-chars, b<-chars, c<-chars,  d<-chars, e<-chars, f<-chars,g<-chars , h<-chars,  a+b+c+ d + e+f+g+h ==72]
  let found= foldr (<|>) empty  $ runPar $ parMap mycompute c
  print found
  print "OK"
  
--mysum xs= foldl (\acc x -> acc+x) 0 xs

mycompute:: [Int] -> Maybe [Int]
mycompute a=  do
  let b= sum a 
  if b==72
    then Just a
    else Nothing

