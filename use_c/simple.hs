import Foreign
import Foreign.C.Types

foreign import ccall "math.h  add_number"
     c_add_number :: CDouble -> CDouble

fastsin :: Double -> Double
fastsin x = realToFrac (c_add_number (realToFrac x))

main = mapM_ (print . fastsin) [0/10, 1/10 .. 10/10]

