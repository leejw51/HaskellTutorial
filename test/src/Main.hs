module Main where

main = show_all 10

show_all 0 = return ()
show_all n = do
  putStrLn "----"
  print $ n
  show_all (n - 1)
