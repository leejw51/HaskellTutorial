import Data.Matrix

m1 = matrix 3 4 $ \ (r, c) -> 4 * (r - 1) + c
m2 = fromList 3 4 [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
m3 = fromLists [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12]]

main
  = do print m1
       print m2
       print m3

       print $ zero 3 4

