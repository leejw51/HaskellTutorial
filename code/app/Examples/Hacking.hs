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
import qualified Data.Time.Clock as Clock
import Control.Monad
import Data.List

main3  = do
  let a= replicateM 5 ['0'..'2']
  let b= head a
  let c= SHA256.hash $ BS2.pack b
  print c

main= do 
  oldtime <-  Clock.getCurrentTime
  let s=  '0'
  let e = '9'
  let a2 = replicateM 8 [s..e]
  putStrLn "enter sha256 to hack"
  b <- getLine
  putStrLn "You Enter=  " >> putStrLn b
  let (c,_)=  B16.decode $ BS2.pack b
  let d= BS.unpack c
  print d
  putStr "total "
  print  $ length d 
  putStrLn "begin computing"
  let ret =  find (\x ->   (( SHA256.hash . BS2.pack)  x) == c ) a2  
  print ret
  putStrLn "Done-----------------"
  newtime <- Clock.getCurrentTime
  let t3=  Clock.diffUTCTime  newtime oldtime
  print "elased time" >> print t3

