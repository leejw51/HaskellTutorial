


main :: IO ()
main=  (let a fs="fox" ++ fs ++ fs in putStrLn $ a "A") >>    (let a fs="bear" ++ fs ++ fs in putStrLn $ a "B") 


