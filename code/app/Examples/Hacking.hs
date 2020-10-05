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

mycompare a myhash=
  if ((SHA256.hash. BS2.pack) a)==myhash
    then a
    else ""

compute [] myhash = ""
compute (x:xs) myhash = par n1 (pseq n2 (if n1=="" then n2 else n1))
  where n1 = mycompare x myhash
        n2 = compute xs myhash

main= do
  let (c,_)=  B16.decode $ BS2.pack "f66edff8c75e2a6de17e15cdd5ed5dbf11fdd1b7cb5823d573bf2aab8997a696"
  let myhash= c
  let a = replicateM 8 ['0'..'9']
  --print a
  let b=compute a myhash
  print b
  print "OK"
