work 0 = return ()
work n
  = do let str = show n ++ "  number"
       putStrLn str
       work (n - 1)

main = work 10
