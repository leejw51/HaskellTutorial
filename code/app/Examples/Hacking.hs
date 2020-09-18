module Examples.Hacking where
import qualified Data.ByteString as BS
import qualified Data.ByteString.Char8 as BS2
import qualified Crypto.Hash.SHA256 as SHA256
import Numeric (showHex)
import qualified Data.ByteString
import Numeric (showHex)
import Data.Char (ord)
main2=do 
    putStr "enter sha256 hash to hack="
    putStrLn ""
    a <- getLine
    putStr "you enter  " >> putStr a >> putStrLn ""

compute [] = putStrLn ""
compute (x:xs)= do
  --let bs = SHA256.hash x
  let s = "sha1 this string"
  let bs= SHA256.hash $ BS.pack x
  --print bs
  putStrLn $ concatMap (flip showHex "") $ BS.unpack bs
  compute xs
main= do 
  let s= 10
  let e = 19
  let a=[ [x0,x1,x2] | x0 <-[s..e],x1<-[s..e], x2<-[s..e]]
  --print  a
  compute a


main5= do
  let s = "sha1 this string"
  let bs = SHA256.hash $ BS2.pack s    
  putStrLn s
  putStrLn $ concatMap (flip showHex "") $ BS.unpack $ SHA256.hash $ BS2.pack s

