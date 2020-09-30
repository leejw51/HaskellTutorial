module Lib
    ( someFunc
    ) where

import Data.Array.Unboxed

someFunc :: IO ()
someFunc = putStrLn "someFunc"

aLargeList :: [Int]
aLargeList = [1 .. 10000000]

aLargeArray :: UArray Int Int
aLargeArray = array (0,9999999) []

zeroIndexArray :: UArray Int Bool
zeroIndexArray = array (0,9) [(3,True)]