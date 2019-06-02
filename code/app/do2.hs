main = putStrLn "enter number" >>= ( \_ ->  getLine  >>= (\a -> putStrLn ("entered =" ++ a) )  )
