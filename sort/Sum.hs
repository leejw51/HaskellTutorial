module Sum where

import Data.Monoid  
  
type Food = String  
type Price = Sum Int  
  
addDrink :: Food -> (Food,Price)  
addDrink "beans" = ("milk", Sum 25)  
addDrink "jerky" = ("whiskey", Sum 99)  
addDrink _ = ("beer", Sum 30)

applyLog (x,log) f = let (y,newLog) = f x in (y,log ++ newLog)  

sum_main = do
  print $ Sum 3 `mappend` Sum 9  
  print $ ("Tobin","Got outlaw name.") `applyLog` (\x -> (length x, "Applied length."))
  print $ ("Bathcat","Got outlaw name.") `applyLog` (\x -> (length x, "Applied length"))  
  putStrLn "OK"