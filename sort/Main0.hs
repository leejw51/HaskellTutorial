module Main where

main :: IO ()
main = do 
  let a= [1..10]
  let b= (\x -> [x^3])
  let c= (\x -> [x-1]) 
  let d= (\x -> [x*100]) 
  let e= (\x -> [x+2]) 
  let o1=a >>=b >>= c >>= d
  let o2=a >>=c >>= b >>= d
  let o3=a >>=b >>= c >>= d
  let o4=a >>=b >>= e >>= d
  let o5=a >>=b >>= e >>= e
  putStrLn $ show o1 
  putStrLn $ show o2 
  putStrLn $ show o3 
  putStrLn $ show o4 
  putStrLn $ show o5 
  putStrLn "monoid == compose functions easily"
