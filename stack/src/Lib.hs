module Lib
    ( someFunc
    ) where


import Control.Monad.State

type Stack = [Int]
pop:: State Stack Int
pop = state $ \(x:xs) -> (x,xs)

push::Int -> State Stack ()
push a = state $ \xs -> ((), a:xs) 

stackManip:: State Stack Int
stackManip= do
  push 100
  push 200
  a <- pop
  pop
  pop
  pop
  pop

someFunc :: IO ()
someFunc = do
  let b=runState stackManip [1..5]
  let a= Just 10
  print $ b
  return ()