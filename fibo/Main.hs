module Main where

main = do
 putStrLn "OK"
 print $ fibo 10


fibo 0 = 0
fibo 1 = 1
fibo  x= fibo (x-1) + fibo(x-2)
