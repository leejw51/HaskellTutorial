myMap func [] = []
myMap func (x : xs) = func x : (myMap func xs)

main
  = do print "ok"
       let a = map (\ x -> x + 2) [1 .. 5]
       print a
       let b = myMap (\ x -> x + 2) [1 .. 5]
       print b
