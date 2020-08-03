module Lib
    ( someFunc
    ) where


--apple:: IO String
apple = do
  return "HELLO"


buy2 (Just a) = return (a + 1000) 
buy (Just a)= print a
buy3 a = Just (a*1000)
pear = putStrLn "pear"


myprint  a = print a
someFunc :: IO ()
someFunc= do
  let a1=Just 200 >>= buy3 >>= (\x -> Just (x+100)) >>= ( \x -> Just x)
  buy a1
  print "OK"

someFunc2 =  apple >>= putStrLn >> pear
