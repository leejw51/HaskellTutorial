main = do print (compute 10)

compute 0 = 0
compute a
  = do let b = a + compute (a - 1)
       b
