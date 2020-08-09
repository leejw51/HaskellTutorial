mydisplay 0 = 0
mydisplay a
  | (rem a 2 == 0) = a + mydisplay (a - 1)
  | otherwise = mydisplay (a - 1)

main = do print $ mydisplay 10

