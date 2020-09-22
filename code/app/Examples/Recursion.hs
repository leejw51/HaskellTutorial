module Examples.Recursion where
import Data.Char (ord)
main=do
  putStrLn "Test Recursion"
  let a=compute2 3 [ord '0'..ord '9']
  print a
  print "OK"

compute2 0 b = [[]]
compute2 n b = [ (c:cs) | c<-b, cs<- (compute2  (n-1)  b  )]



compute :: (Eq t, Num t) => t -> [Char] -> [[Char]]
compute 0 b = [""]
compute n b  = [ (c:cs) | c<-b, cs<-  (compute (n-1) b) ]

--compute a  b = fmap (+a) b 

compute3 0 _ = do
  print "ZERO" 

compute3 a b= do
  print a >> print b