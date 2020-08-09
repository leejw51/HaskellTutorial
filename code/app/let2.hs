
main = putStrLn "OK" >> putStrLn "OK2"
--  main2

main2
  = putStrLn "OK3" >> (let a fs = fs ++ fs in putStrLn $ a "apple") >>
      putStrLn "OK4"
