qsort [] = []
qsort (p : xs) = qsort lesser ++ [p] ++ qsort greater
  where lesser = filter (< p) xs
        greater = filter (>= p) xs

main = print $ qsort [100, 20, 5, 30, 1, 5, 20000, 10000, 3000]

