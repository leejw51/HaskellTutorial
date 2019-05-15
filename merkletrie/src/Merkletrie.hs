module Merkletrie where

putData key value = do
 let filepath= "./db/" ++ key
 writeFile filepath $ show value
 putStrLn "ok"

hello = do
 putData "h" 100
 putStrLn "hello i'm merkletrie"
 