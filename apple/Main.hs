module Main where
import Test (test_main)
import Sha (sha_main)
import Text.Format
main= do  
  --test_main
  --sha_main
  a <- getLine 
  let b= format "Data= {0}" [a]
  putStrLn b

