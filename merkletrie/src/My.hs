module My where

import Data.Digest.Pure.SHA
import Data.ByteString.Lazy.UTF8 

-- ok
myFunc = do
 putStrLn "pleae enter string =" >>
  getLine >>= \a -> print $ sha256 $ fromString a