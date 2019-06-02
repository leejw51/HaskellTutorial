compute [] = return ()
compute (x:xs) = do
    compute(xs)
    print x
    


main = do 
    compute [1..10]
    print "OK"