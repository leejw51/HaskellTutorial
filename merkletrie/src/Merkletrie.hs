module Merkletrie where

putData key value = do
 let filepath= "./db/" ++ key
 writeFile filepath $ show value

getData key = do
 let filepath= "./db/" ++ key
 source <- readFile filepath
 return source

hello = do
 putData "h" 100
 b <- getData "h"
 putStr "==============getData=" >> putStr  b >> putStrLn ""
 putStrLn "hello i'm merkletrie============================================"
 