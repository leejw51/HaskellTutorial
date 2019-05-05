all: install alpha

alpha: a.hs
	ghc a.hs
	./a

install:
	cabal install Matrix
