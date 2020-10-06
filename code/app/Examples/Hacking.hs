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
import Control.Exception
import Data.Time.Clock
import Text.Printf
import System.Environment
import Control.Monad.Par
import Data.Maybe


mycompare a myhash=
  if ((SHA256.hash. BS2.pack) a)==myhash
    then a
    else ""

compute [] myhash = ""
compute (x:xs) myhash = par n1 (pseq n2 (if n1=="" then n2 else n1))
  where n1 = mycompare x myhash
        n2 = compute xs myhash

main22= do
  let (c,_)=  B16.decode $ BS2.pack "f66edff8c75e2a6de17e15cdd5ed5dbf11fdd1b7cb5823d573bf2aab8997a696"
  let myhash= c
  let a = replicateM 8 ['0'..'9']
  --print a
  let b=compute a myhash
  print b
  print "OK"


myadd a = return Just (a+ 10)	


myprint (Just x) = print x
mysolve a = return $  Just (10*a)
main = do 
  let a= [1..10]
  let c = runPar $ parMap myadd a
  --let d = filter isJust c
  --print d
  putStrLn "OK"