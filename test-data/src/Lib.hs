module Lib
    ( someFunc
    ) where

data Fruit = Apple String  Int | Pear Int deriving (Show)
someFunc :: IO ()
someFunc = do 
  let  a=Apple "mcintosh" 100
  let b = Pear 200
  print a
  print b
