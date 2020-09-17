module Examples.Hacking where


main2=do 
    putStr "enter sha256 hash to hack="
    putStrLn ""
    a <- getLine
    putStr "you enter  " >> putStr a >> putStrLn ""

compute [] = putStrLn ""
compute (x:xs)= do
  print x
  compute xs
main= do 
  let s= 0
  let e = 9
  let a=[ [x0,x1,x2] | x0 <-[s..e],x1<-[s..e], x2<-[s..e]]
  --print  a
  compute a