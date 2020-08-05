import Data.Array
main = test2 2 10
test2 s e
  = do let a = array (s, e) [(i, 2000) | i <- [s .. e]]
       let a' = a // [(s, 100)]
       putStrLn $ "original: " ++ show a
       putStrLn $ "new: " ++ show a'

