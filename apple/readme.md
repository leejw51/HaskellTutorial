## monoid
monoid == function composition with style

## source location
```
./libraries/base/GHC/Base.hs
```

## class inheritance in haskell
```
class A => B
```
parent: A
child: B


## Functor  fmap
```
class Functor f where
fmap :: (a -> b) -> f a -> f b
```
example
```
Prelude> fmap (*100) [1..5]
[100,200,300,400,500]
Prelude> fmap (*100) (Just 10)
Just 1000

```

## Applicative <*>
```
class Functor f => Applicative f where
(<*>) :: f (a -> b) -> f a -> f b
```
example
```
Prelude> [(+100),(^2)] <*> [1..5]
[101,102,103,104,105,1,4,9,16,25]
```

## Monad   >>=
```
class Applicative m => Monad m where
-- | Sequentially compose two actions, passing any value produced
-- by the first as an argument to the second.
(>>=) :: forall a b. m a -> (a -> m b) -> m b

-- | Sequentially compose two actions, discarding any value produced
-- by the first, like sequencing operators (such as the semicolon)
-- in imperative languages.
(>>) :: forall a b. m a -> m b -> m b
m >> k = m >>= \_ -> k -- See Note [Recursive bindings for Applicative/Monad]
{-# INLINE (>>) #-}

-- | Inject a value into the monadic type.
return :: a -> m a
return = pure

-- | Fail with a message. This operation is not part of the
-- mathematical definition of a monad, but is invoked on pattern-match
-- failure in a @do@ expression.
--
-- As part of the MonadFail proposal (MFP), this function is moved
-- to its own class 'MonadFail' (see "Control.Monad.Fail" for more
-- details). The definition here will be removed in a future
-- release.
fail :: String -> m a
fail s = errorWithoutStackTrace s
```

## monad make coding very short
source
```
main = do
  putStrLn "maybe main"
  print $ h 0
  print $ h 100
  print $ h 200
  putStrLn "------------------------------"
  print $ h' 0
  print $ h' 100
  print $ h' 200

f 0 = Nothing
f x = Just x

g 100 = Nothing
g x = Just x

h x = do
  f x >>= g
 

h'    x = case f x of
        Just n -> g n
        Nothing -> Nothing

```
result
```
maybe main
Nothing
Nothing
Just 200
------------------------------
Nothing
Nothing
Just 200

```
## monoid
monoid == function composition with style

## source location
```
./libraries/base/GHC/Base.hs
```

## class inheritance in haskell
```
class A => B
```
parent: A
child: B


## Functor  fmap
```
class Functor f where
fmap :: (a -> b) -> f a -> f b
```
example
```
Prelude> fmap (*100) [1..5]
[100,200,300,400,500]
Prelude> fmap (*100) (Just 10)
Just 1000

```

## Applicative <*>
```
class Functor f => Applicative f where
(<*>) :: f (a -> b) -> f a -> f b
```
example
```
Prelude> [(+100),(^2)] <*> [1..5]
[101,102,103,104,105,1,4,9,16,25]
```

## Monad   >>=
```
class Applicative m => Monad m where
-- | Sequentially compose two actions, passing any value produced
-- by the first as an argument to the second.
(>>=) :: forall a b. m a -> (a -> m b) -> m b

-- | Sequentially compose two actions, discarding any value produced
-- by the first, like sequencing operators (such as the semicolon)
-- in imperative languages.
(>>) :: forall a b. m a -> m b -> m b
m >> k = m >>= \_ -> k -- See Note [Recursive bindings for Applicative/Monad]
{-# INLINE (>>) #-}

-- | Inject a value into the monadic type.
return :: a -> m a
return = pure

-- | Fail with a message. This operation is not part of the
-- mathematical definition of a monad, but is invoked on pattern-match
-- failure in a @do@ expression.
--
-- As part of the MonadFail proposal (MFP), this function is moved
-- to its own class 'MonadFail' (see "Control.Monad.Fail" for more
-- details). The definition here will be removed in a future
-- release.
fail :: String -> m a
fail s = errorWithoutStackTrace s
```

## monad make coding very short  
source  


## example1
by monoid, can compose functions easily.
```
module Main where

main :: IO ()
main = do
  let a= [1..10]
  let b= (\x -> [x^3])
  let c= (\x -> [x-1])
  let d= (\x -> [x*100])
  let e= (\x -> [x+2])
  let o1=a >>=b >>= c >>= d
  let o2=a >>=c >>= b >>= d
  let o3=a >>=b >>= c >>= d
  let o4=a >>=b >>= e >>= d
  let o5=a >>=b >>= e >>= e
  putStrLn $ show o1
  putStrLn $ show o2
  putStrLn $ show o3
  putStrLn $ show o4
  putStrLn $ show o5
  putStrLn "monoid == compose functions easily"

```
output
```
cabal run
Preprocessing executable 'test' for test-0.1.0.0...
Running test...
[0,700,2600,6300,12400,21500,34200,51100,72800,99900]
[0,100,800,2700,6400,12500,21600,34300,51200,72900]
[0,700,2600,6300,12400,21500,34200,51100,72800,99900]
[300,1000,2900,6600,12700,21800,34500,51400,73100,100200]
[5,12,31,68,129,220,347,516,733,1004]
monoid == compose functions easily

```

## example2
function composition
```
module Main where
main :: IO ()
main = do
  let a= [1..10]
  let b=  compute_d .compute_c
  let c= b 10
  let c2= compute_d $ compute_c 10
  putStrLn $ show c
  putStrLn $ show c2
compute_c x = x-1
compute_d x = x*100
 ```
output
```
cabal run
Preprocessing executable 'test' for test-0.1.0.0...
[1 of 1] Compiling Main ( Main.hs, dist/build/test/test-tmp/Main.o )
Linking dist/build/test/test ...
Running test...
900
900

```

## example3
```

Prelude> putStr "ENTER " >> getLine >>= putStrLn
ENTER 100
100

```



## example 4
```
Prelude> double a = a ++ a
Prelude> walk a = putStrLn $ double a
Prelude> getLine >>= walk
ok
okok
Prelude> :info double
double :: [a] -> [a] -- Defined at <interactive>:32:1
Prelude> :info walk
walk :: [Char] -> IO () -- Defined at <interactive>:33:1

```



