
data Person = Person{name :: String, area :: String, age :: Int}
                deriving (Show, Eq)

main
  = do let mike = Person{name = "Michael", area = "Diamond", age = 1}
       print $ show mike
       putStrLn "OK"
