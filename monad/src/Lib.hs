module Lib
    ( someFunc
    ) where


--apple:: IO String
apple = do
  return "HELLO"

someFunc :: IO ()
someFunc =  apple >>= putStrLn
