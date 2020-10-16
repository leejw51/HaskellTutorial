module Main where

mysum :: Num p => [p] -> p
mysum [] = 0
mysum (x:xs) = x + mysum xs

mysum2 :: (Foldable t, Num a) => t a -> a
mysum2 xs = foldl (\acc x -> acc+x) 0 xs


mysum3 xs = found
  where 
    found= mysum(xs)

mysum4 xs = do 
  let sum= mysum(xs)
  sum

main = do
  let a= mysum [1..10]
  print a
  let b= mysum2 [1..10]
  print b
  let c= mysum3 [1..10]
  print c
  let d= mysum3 [1..10]
  print d

