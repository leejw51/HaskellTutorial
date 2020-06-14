module Test where

import           Control.Monad
import           Data.Char     (toUpper)

compute x = x * 2

add_apple x = x + 100

main2 = do
  putStrLn "write=" >> fmap shout getLine >>= putStrLn >> putStrLn "  apple ]["

shout = map toUpper

hello a = do
  let b = a + 10
  b

show_all 0 = return ()
show_all a = do
  putStrLn a
  show_all (a - 1)
