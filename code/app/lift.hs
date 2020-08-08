module Main where
import Control.Monad

main :: IO ()
main
  = do let m = liftM (* 3) (Just 100)
       print m
