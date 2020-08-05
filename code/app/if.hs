mydisplay 0 = 0
mydisplay a
  = do let b = if rem a 2 == 0 then a + mydisplay (a - 1) else mydisplay (a - 1)
       b

mydisplay2 0 = 0
mydisplay2 a
  = do let b = if rem a 2 == 1 then a + mydisplay2 (a - 1) else
                 mydisplay2 (a - 1)
       b

main
  = do print $ mydisplay 10
       print $ mydisplay2 10

