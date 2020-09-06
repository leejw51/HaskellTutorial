module Unicode where
import  Data.ByteString.UTF8 as U
import Numeric (showHex)
import Data.HexString as H
import qualified Data.ByteString as B
main = do
    let a= U.fromString "한글"
    let b = U.toString a
    print a
    putStrLn b
    print $ B.foldr showHex "" a
    putStrLn "************************"
    let h1= H.fromBytes a
    print h1
    let h2= H.toBytes h1
    putStrLn $ U.toString h2
 