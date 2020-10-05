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

import Control.Parallel
import Control.Parallel.Strategies
import Control.Exception
import Data.Time.Clock
import Text.Printf
import System.Environment


test = do
  let d= [1..10]
  let d2=[1..1000]
  a <- rpar (sum d)
  b <- rpar (sum d2)
  return [a,b]

main2= do
  r <- evaluate (runEval test)
  print r
  putStrLn "OK"

nfib :: Int -> Int
nfib n | n <= 1 = 1
       | otherwise = par n1 (pseq n2 (n1 + n2 ))
                     where n1 = nfib (n-1)
                           n2 = nfib (n-2)

nfib2 n | n <= 1 = 1
        | otherwise = n1 `par` n2 `pseq`  (n1 + n2 )
                     where n1 = nfib (n-1)
                           n2 = nfib (n-2)


-- slow fibonacci
fib :: Integer -> Integer
fib 0 = 1
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)

main= do
  let a= nfib 10
  let b = nfib2 10
  let c = fib 10
  print a
  print b 
  print c
  print "OK"