module Lib
    ( someFunc
    ) where

import Data.Array.Unboxed
import Data.Word

import Control.Monad

someFunc :: IO ()
someFunc = do
  let m= my1
  print m
  print "OK"

my1= do 
  a <- ['0'..'9']
  b <- ['0'..'9']
  array (0.10) [a,b] 

aLargeList :: [Int]
aLargeList = [1 .. 10000000]

aLargeArray :: UArray Int Int
aLargeArray = array (0,9999999) []

zeroIndexArray :: UArray Int Bool
zeroIndexArray = array (0,9) [(3,True)]

myArray2 :: UArray Word8 Word8
myArray2 = array (1,3) []


fooArray :: UArray (Int, Int) Char
fooArray = listArray ((0,0), (9,9)) (replicate 100 'f')