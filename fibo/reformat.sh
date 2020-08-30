#!/bin/bash
find ./src -name '*.hs' -type f -print0 | xargs -0 -I {} -n 1 haskell-formatter --force --input {} --output {}
find ./app -name '*.hs' -type f -print0 | xargs -0 -I {} -n 1 haskell-formatter --force --input {} --output {}
