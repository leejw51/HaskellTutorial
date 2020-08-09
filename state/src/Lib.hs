module Lib
    ( someFunc
    ) where

import Control.Monad.State



type GameValue = Int
type GameState = (Bool, Int)

-- type=State s a  :  s= initial state,   a= final value
playGame:: String-> State GameState GameValue
playGame [] = do
  (_,score)  <- get
  return score

playGame (x:xs) = do
  (on, score) <- get 
  case x of 
    'a' | on -> put (on, score +1)
    'b' | on -> put (on, score -1)
    'c'   -> put(not on, score) 
    _  -> put (on, score)
  playGame xs

startState = (True, 0)


someFunc :: IO ()
someFunc = print $ evalState ( playGame "aaa") startState 
