factorial 1 = 1
factorial a = a* factorial (a-1)

main = do
    putStrLn "enter number="
    h <- getLine
    if h=="" then do
      putStrLn "bye"
     else do
      let n = read h :: Integer
      let x = factorial(n)  
      putStrLn $"apple=" ++ show x
      main


