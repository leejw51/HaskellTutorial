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

someFunc :: IO ()
someFunc = do
  db <- initializeDB "note"
  let a1 = BSU.fromString "워드"
  let a2 = BSU.fromString "워드"
  put db def a1 a2
  get db def a1 >>= print2
  putStrLn "OK"
  return ()
  
