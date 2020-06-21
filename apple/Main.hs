module Main where
import Test (test_main)
import Sha (sha_main)

main= do  
  test_main
  sha_main
  putStrLn "OK"

