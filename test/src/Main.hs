import           Test

main = do
  runb [1..10]
  putStrLn "OK"


runa 0 = putStrLn ""
runa a = do 
  print $ a
  runa (a-1)


runb [] = do
  putStrLn "done"
runb a = do
  print $ head a
  let b= drop 1 a
  runb b
  
