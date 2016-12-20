#!/bin/bash -e
vint --warning --color $(git ls-files | grep -e '\.vim$' | grep -v vital)
