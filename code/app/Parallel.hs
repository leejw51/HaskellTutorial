module Parallel where

import Control.Parallel
import Control.Parallel.Strategies
import Control.Exception
import Data.Time.Clock
import Text.Printf
import System.Environment

fib2 1 = 1:[]
fib2 2 = 1:1:[]
fib2 n = sum(take 2 f):f where f = fib2 (n-1)

fib3 n = fib2 n !! 0

-- <<fib
fib :: Integer -> Integer
fib 0 = 1
fib 1 = 1
fib n = fib (n-1) + fib (n-2)
-- >>


parallel_main = do
  let test = test_fast
  t0 <- getCurrentTime
  r <- evaluate (runEval test)
  printTimeSince t0
  print r
  printTimeSince t0

parallel_main2 = do
  t0 <- getCurrentTime
  printTimeSince t0
  let r= fib2 200
  print r
  printTimeSince t0
-- >>
-- <<main
parallel_main3 = do
  [n] <- getArgs
  print n
  let test = [test1,test2,test3,test4] !! (read n - 1)
  t0 <- getCurrentTime
  r <- evaluate (runEval test)
  printTimeSince t0
  print r
  printTimeSince t0
-- >>


test_fast = do
  x <- rpar (fib3 5)
  y <- rpar (fib3 37)
  z <- rpar (fib3 39)
  z2 <- rpar (fib3 200)
  return (x,y,z,z2)

test8 = do
  y <- rpar (fib 2000)
  return (y)


test7 = do
  x <- rpar (fib 5)
  y <- rpar (fib 37)
  z <- rpar (fib 39)
  z2 <- rpar (fib 41)
  return (x,y,z,z2)

-- <<test1
test1 = do
  x <- rpar (fib 36)
  y <- rpar (fib 35)
  return (x,y)
-- >>

-- <<test2
test2 = do
  x <- rpar (fib 36)
  y <- rseq (fib 35)
  return (x,y)
-- >>

-- <<test3
test3 = do
  x <- rpar (fib 36)
  y <- rseq (fib 35)
  rseq x
  return (x,y)
-- >>

-- <<test4
test4 = do
  x <- rpar (fib 36)
  y <- rpar (fib 35)
  rseq x
  rseq y
  return (x,y)
-- >>

printTimeSince t0 = do
  t1 <- getCurrentTime
  printf "time: %.2fs\n" (realToFrac (diffUTCTime t1 t0) :: Double)

