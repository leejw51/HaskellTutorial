mysort [] = do putStrLn "done"
mysort x
  = do let (a : b) = x
       print a
       mysort b
main = mysort [10, 20, 30]
