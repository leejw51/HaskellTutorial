module Main where

import Numeric (showHex)
import qualified Data.ByteString as BS
import qualified Data.ByteString.Char8 as BS2
import qualified Crypto.Hash.SHA256 as SHA256
import qualified Crypto.Hash.SHA512 as SHA512
import qualified Crypto.Hash.SHA1 as SHA1
main :: IO ()
main = do
  let s = "sha1 this string"
  let bs = SHA256.hash $ BS2.pack s    
  putStrLn s
  putStrLn $ concatMap (flip showHex "") $ BS.unpack $ SHA512.hash $ BS2.pack s
  putStrLn $ concatMap (flip showHex "") $ BS.unpack $ SHA256.hash $ BS2.pack s
  putStrLn $ concatMap (flip showHex "") $ BS.unpack $ SHA1.hash $ BS2.pack s
  print$  BS.unpack bs
  --putStrLn $ showHex 100,1,3] "--"
  print $ concatMap (\x -> [(x,x+2,x/2)]) [1,3,5] 
  putStrLn "OK"
