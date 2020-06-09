module Main where

main :: IO ()
main = do
  putStrLn "Hello, Haskell!"
  putStrLn "OK"
  print $ sayMe 1

sayMe :: (Integral a, Integral b) => a -> b
sayMe 1 = 100
sayMe 5 = 500
sayMe x = 0
