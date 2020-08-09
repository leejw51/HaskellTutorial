module Lib
    ( someFunc
    ) where

import Control.Monad

import           Control.Monad.IO.Class      
import System.IO   
import  Data.Default (def)
import Database.RocksDB 
import qualified Data.ByteString.Char8 as C
import qualified Data.ByteString.Lazy as BL
import qualified Data.ByteString as BS
import qualified Data.Text as TS
import qualified  Data.Text.Lazy as TL
import qualified  Data.ByteString.Lazy.UTF8 as BLU -- from utf8-string
import qualified  Data.ByteString.UTF8 as BSU      -- from utf8-string
import qualified  Data.Text.Encoding as TSE
import qualified  Data.Text.Lazy.Encoding as TLE

initializeDB path = open path defaultOptions{createIfMissing = True, compression = NoCompression}


myPrint :: Show a => Maybe a -> IO ()
myPrint (Just x) = print x
myPrint n        = print n


print2 (Just a) = do 
  let b= BSU.toString a
  putStrLn b

someFunc2:: IO ()
someFunc2 = return ()


writeDB db key2 data2 = do
  let k = BSU.fromString key2
  let d = BSU.fromString data2
  put db def k d

writeNodes db 0 = return ()
writeNodes db a = do
  let k= "애플" ++ (show a)
  let d= "데이터" ++ (show a)
  putStrLn $ k ++ "  " ++ d
  writeDB db k d
  writeNodes db $ a-1

printNode db a = do
  get db def  ( BSU.fromString a ) >>= print2


someFunc3 :: IO ()
someFunc3 = do
  db <- initializeDB "note"
  writeNodes db 10
  printNode db "애플1"
  printNode db "애플2"
  --get db def  ( BSU.fromString "워드" ) >>= print2
  putStrLn "OK"
  return ()
  
test1= putStrLn "1" >> putStrLn "2"

test2= putStrLn "3" >> putStrLn "4"

someFunc:: IO ()
someFunc = test1 >> test2