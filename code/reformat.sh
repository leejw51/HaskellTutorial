#!/bin/bash
find . -name '*.hs' -type f -print0 | xargs -0 -I {} -n 1 haskell-formatter --force --input {} --output {}
