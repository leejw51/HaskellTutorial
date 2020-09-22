module Examples.Hacking where
import qualified Data.ByteString as BS
import qualified Data.ByteString.Char8 as BS2
import qualified Crypto.Hash.SHA256 as SHA256
import Numeric (showHex)
import qualified Data.ByteString
import Numeric (showHex)
import Data.Char (ord)
import Data.Word
import qualified Data.ByteString.Internal as BS3 (c2w, w2c)
import qualified Data.ByteString.Base16 as B16
import Data.Char (ord)

main11=do 
    putStr "enter sha256 hash to hack="
    putStrLn ""
    a <- getLine
    let (c,_)=  B16.decode $ BS2.pack a
    putStr "you enter  " >> putStr a
    print c
    
compute [] target = putStrLn ""
compute (x:xs) target= do
  --let bs = SHA256.hash x
  let bs= SHA256.hash $ BS.pack x
  let bs2= BS.unpack bs
  --print x
  --putStrLn $ concatMap (flip showHex "") bs2
  if bs2==target 
    then do
      putStrLn "found"
      putStrLn $ BS2.unpack $ BS.pack x
    else compute xs target

compute2 0 b = [[]]
compute2 n b = [ (c:cs) | c<-b, cs<- (compute2  (n-1)  b  )]

main5 = do
  let a= [1,2,3]
  let b= BS.pack a
  --print $ BS.unpack $ SHA256.hash b
  --print $ BS2.unpack $ SHA256.hash $ BS2.pack "apple"
  --let c= B16.encode $ BS2.pack"123"
  --let d= B16.decode c
  --print c
  --print d
  let (c,_)=  B16.decode $ BS2.pack "3132333131"
  print $ BS.unpack c
  
main= do 
  let s= BS3.c2w '0'
  let e = BS3.c2w '9'
  --let a2=[ [x0,x1,x2] | x0 <-[s..e],x1<-[s..e], x2<-[s..e]]
  let a2= compute2 8 [s..e]
  putStrLn "enter sha256 to hack"
  b <- getLine
  putStrLn "You Enter=  " >> putStrLn b
  let (c,_)=  B16.decode $ BS2.pack b
  let d= BS.unpack c
  print d
  putStr "total "
  print  $ length d 
  compute a2 d


main3= do
  let s = "sha1 this string"
  let bs = SHA256.hash $ BS2.pack s    
  putStrLn s
  putStrLn $ concatMap (flip showHex "") $ BS.unpack $ SHA256.hash $ BS2.pack s

