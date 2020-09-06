module Qsort4 where

qsort :: Ord a => [a] -> [a]
qsort [] = []
qsort (x : xs)
  = let small = [y | y <- xs, y < x]
        big = [y | y <- xs, y > x]
      in qsort small ++ [x] ++ qsort big

main :: IO ()
main = do print $ qsort [10, 2, 20]

