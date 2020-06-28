module Main where
import System.Random


main = do
  compute1
  compute2

compute1 = do
  g <- getStdGen
  let b = take 10 (randomRs ('a','z') g)
  let a = quicksort b
  print $ a

compute2 = do
  let a = [1000,20,500,30, 80,9000000,2000,53, 800]
  print $ quicksort a

quicksort [] = []
quicksort (x:xs) =
  let small =  [a | a<-xs  , a<=x]
      big =  [ a | a<-xs, a>x]
  in  quicksort small ++ [x] ++ quicksort big