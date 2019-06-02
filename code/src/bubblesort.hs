main = do
  let a= bubbleSort [10,5000000000000000000000000000000000000000000000000,2]
  print a
  

bubbleSort :: (Ord a) => [a] -> [a]
bubbleSort [] = []
bubbleSort [x] = [x]
bubbleSort (x:y:arrLeft) = bubbleSort(init bubbled) ++ [last bubbled]
    where (smaller,bigger) = if(x <= y) then (x, y) else (y, x)
          bubbled = [smaller] ++ bubbleSort (bigger:arrLeft)