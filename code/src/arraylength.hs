ordPairs xs =
 xs >>= \x1 ->
 xs >>= \x2 ->
 xs >>= \x3 ->
 [(x1,x2,x3)]

main = do
 let a = ordPairs [ 1,2,3]
 let b = length a
 putStrLn $"array length=" ++ show b