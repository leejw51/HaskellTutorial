mysort []= []
mysort [x] = [x]

mysort x = do
 let (a:b:c) = x  
 let bubbled = if (a < b)
                then [a] ++ mysort(b:c) 
                else [b] ++ mysort(a:c)
 let ret = mysort(init bubbled) ++ [last bubbled]
 ret

main = do 
 let a = mysort [10,30,500,35,220]
 print a
