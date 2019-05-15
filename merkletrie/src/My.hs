module My where

import Data.Digest.Pure.SHA
import Data.ByteString.Lazy.UTF8 
import Merkletrie
-- grouped expression should be aligned
-- ok
myFunc = do putStrLn "pleae enter string2 ="   
            a <- getLine 
            let hash =  sha256 $  fromString a
            let b = show hash
            putData b a
            putStrLn $ show hash  
            let f = Prelude.length a
            if Prelude.length a > 0 
             then 
              myFunc
             else 
              return ()
             