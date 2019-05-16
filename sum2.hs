mysum 0 = 0
mysum a =  a + mysum (a-1)
main = do
    n <- getLine
    let x = read n :: Integer
    putStrLn $ show $ mysum x