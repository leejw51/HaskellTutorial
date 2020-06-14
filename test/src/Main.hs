module Main where

import           Control.Monad

main :: IO ()
main = do
  show_all 5

main2 = do
  a <- getLine
  putStrLn a

show_all :: Int -> IO ()
show_all 0 = return ()
show_all n = do
  putStrLn "----"
  print $ n
  show_all (n - 1)
