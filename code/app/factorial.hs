main = print $ factorial 4 


factorial 1 = 1
factorial a =  a * factorial (a-1)
