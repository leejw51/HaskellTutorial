module Main where

main = do
  show_all 10
  return ()

show_all 0 = return ()
show_all n = do
  putStrLn "----"
  print $ n
  show_all (n - 1)
