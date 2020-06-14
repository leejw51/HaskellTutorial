module Main where

import           Control.Monad
import           Data.Char     (toUpper)
import           Test

main :: IO ()
main = do
  putStrLn "write=" >> fmap shout getLine >>= putStrLn >> putStrLn "  apple ]["

shout = map toUpper

hello :: Float -> Float
hello a = do
  let b = a + 10
  b
