module Main where

import           Test

main :: IO ()
main = do
  putStrLn hello
  print $ compute 10
  print $ add_apple 20

hello :: String
hello = "Hello"
