module Main where
import Test (test_main)
import Sha (sha_main,compute_sha)
import Text.Format
import System.IO

main= do
  let a= [1..10]
  let b=a >>= \x -> return (x*2) >>= \x -> return (x^2)
  print $ b

main4=do
  a <- getLine
  let b= compute_sha a
  putStrLn b
  putStrLn "OK"

main3= do
  putStrLn $ compute_sha "apple";
  putStrLn $ compute_sha "apple2";

main2= do  
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
