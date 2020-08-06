mysort[] = []
mysort[x] = [x]

mysort a = do
 let (x:y:xs) = a
 let bubble= if (x<=y) then [x] ++ mysort(y: xs) else [y] ++ mysort(x: xs) 
   in mysort (init bubble) ++  [last bubble]

main = do
 let b= mysort [10, 5, 20,1,3]
 print b
 