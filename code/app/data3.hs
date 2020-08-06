
data List a = Empty
            | Cons a (List a)
                deriving (Show, Read, Eq, Ord)
main
  = do let a2 = 2 `Cons` (2000 `Cons` Empty)
       print $ show a2
       putStrLn "OK"
