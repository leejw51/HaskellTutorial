module Main where
import Test (test_main)
import Sha (sha_main)
import Text.Format
import System.IO
main= do  
  --test_main
  --sha_main
  --a <- getLine 
  --let b= format "Data= {0}" [a]
  run_loop 10
  --putStrLn b
  putStrLn "OK"


run_loop:: Integer -> IO ()
run_loop 0 = return ()
run_loop  x = do
  putStrLn $ show x
  run_loop (x-1)
