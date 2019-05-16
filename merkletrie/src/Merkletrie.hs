-- coded by jongwhan lee
-- 2019
-- for the future

module Merkletrie where
import Data.Digest.Pure.SHA
import Data.ByteString.Lazy.UTF8 

data Tree a = Empty  | Node {value::a,   leftnode:: (Tree a),    rightnode::(Tree a)} deriving(Show,Eq)

putData key value = do
 let filepath= "./db/" ++ key
 writeFile filepath $ show value

getData key = do
 let filepath= "./db/" ++ key
 source <- readFile filepath
 return source

display Empty=[]
display ( Node v left right) = display left ++ [v] ++ display right

showhash Empty=[]
showhash (Node v left right) = do
    let hash =  sha256 $  fromString v
    showhash left ++ [hash] ++ showhash right

hello2 = putStr "OK"

hello3 = do
    let a = Node "apple" (Node "pear" Empty Empty) Empty 
    putStrLn $ "node=" ++ show a
    putStrLn "OK"

hello = do
    let a = Node "apple" (Node "pear" Empty (Node "strawberry" Empty Empty)) Empty
    let b = display a
    print b
    let c = showhash a
    print c
    putStrLn("OK==================================")