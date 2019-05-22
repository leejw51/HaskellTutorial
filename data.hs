
-- my structure
data Shape= Circle Float Float Float | Rectangle Float Float Float Float deriving (Show)
surface::Shape->Float 
surface (Circle x  y r) = pi* r^2
surface (Rectangle x1 y1 x2 y2) = (x2-x1) * (y2-y1)

-- main function
main::IO()
main = do
    let a = Circle 10 11 20
    let b = Rectangle 1 2 3 4
    putStr $ show a
    putStr " = "
    putStr $ show $ surface a
    putStrLn "\n------------------------------"
    putStr $ show b
    putStr " = "
    putStr $ show $ surface b
    putStrLn "\n------------------------------"