import Data.Char (toUpper)

make s = [toUpper c | c <- s]

main = do
  let b= make "hello"
  print b