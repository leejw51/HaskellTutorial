module Main where

import Numeric (showHex)
import qualified Data.ByteString as BS
import qualified Data.ByteString.Char8 as BS2
import qualified Crypto.Hash.SHA256 as SHA256
import qualified Crypto.Hash.SHA1 as SHA1
main :: IO ()
main = do
  let s = "sha1 this string"
  let bs = SHA256.hash $ BS2.pack s    
  Prelude.putStrLn s
  putStrLn $ concatMap (flip showHex "") $ BS.unpack bs
  print$  BS.unpack bs
  --putStrLn $ showHex 100,1,3] "--"
  print $ concatMap (\x -> [(x,x+2,x/2)]) [1,3,5] 
  Prelude.putStrLn "OK"
