module Maybe where


maybe_main = do
  putStrLn "maybe main"
  print $ h 0
  print $ h 100
  print $ h 200
  putStrLn "------------------------------"
  print $ h' 0
  print $ h' 100
  print $ h' 200

f 0 = Nothing
f x = Just x

g 100 = Nothing
g x = Just x 

h x = do 
  f x >>= g
  

h'    x = case f x of 
        Just n -> g n 
        Nothing -> Nothing