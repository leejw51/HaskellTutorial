main = putStrLn "enter number" >>= ( \_ ->  getLine  >>= (\a -> putStrLn ("entered =" ++ a) >>= ( \_ -> putStrLn "done"))  )
