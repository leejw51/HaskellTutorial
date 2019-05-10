module My where

import Data.Digest.Pure.SHA
import Data.ByteString.Lazy.UTF8 

-- grouped expression should be aligned
-- ok
myFunc = do putStrLn "pleae enter string2 =" 
            a <- getLine  
            print $ sha256 $ fromString a
            myFunc