module Main where
import Control.Monad
import Data.List
import qualified Data.Map as Map

main :: IO ()
main
  = do let a = Map.empty
       let b = Map.insert 100 "apple" a
       let c = Map.insert 200 "apple ][" b
       let d = "apple" ++ show 1000000
       print c
       putStrLn $ show 200000000000000
       putStrLn d
       print "OK"

main2
  = do let a = [1 .. 100]
       let b = find (> 8) a
       print b
