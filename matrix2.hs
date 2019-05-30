import Data.Matrix

compute = do
	putStrLn "compute"
	let m = matrix 4 4 $ \(i,j) -> (i*j)
	let n = matrix 4 4 $ \(i,j) -> (i-j)
	print m
	print n
	let c = m* n
	print c 

main = do
	compute
