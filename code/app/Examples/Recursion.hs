module Examples.Recursion where

main=do
  putStrLn "Test Recursion"
  let a= compute 3
  print a

compute2 0 = [[]]
compute2 n = [ (c:cs) | c<-x, cs<- compute2 $ n-1]
  where x=[0..9]


compute 0 = [""]
compute n = [ (c:cs) | c<-x, cs<- compute $ n-1]
  where x=['0','1','2']