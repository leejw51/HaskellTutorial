module Parallel where
import Control.Exception

import Control.Parallel
import Control.Parallel.Strategies
import Data.Time.Clock
import System.Environment
import Text.Printf

fib2 1 = 1 : []
fib2 2 = 1 : 1 : []
fib2 n = sum (take 2 f) : f
  where f = fib2 (n - 1)

fib3 n = fib2 n !! 0

-- slow fibonacci
fib :: Integer -> Integer
fib 0 = 1
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)

printNumber [] = return ()
printNumber (x : xs)
  = do putStrLn $ show x
       printNumber xs
parallel_main
  = do let test = test_fast
       t0 <- getCurrentTime
       r <- evaluate (runEval test)
       printTimeSince t0
       -- fmap (\x -> putStrLn x) r
       printNumber r
       --print r
       printTimeSince t0

test_fast
  = do x <- rpar (fib3 1000)
       y <- rpar (fib3 2000)
       z <- rpar (fib3 3000)
       z1 <- rpar (fib3 4000)
       return [x, y, z, z1]

printTimeSince t0
  = do t1 <- getCurrentTime
       printf "time: %.9fs seconds\n" (realToFrac (diffUTCTime t1 t0) :: Double)

