module Lib
    ( someFunc
    ) where


--apple:: IO String
apple = do
  return "HELLO"

pear = putStrLn "pear"
someFunc :: IO ()
someFunc =  apple >>= putStrLn >> pear
