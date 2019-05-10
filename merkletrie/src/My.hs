module My where

import Data.Digest.Pure.SHA
import Data.ByteString.Lazy.UTF8 as BLU

myFunc = do
 let a = "hello world"
 print $  sha256 $ BLU.fromString a