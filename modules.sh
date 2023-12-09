#!/bin/bash

# information-reader
if [ -f "$PREFIX"usr/lib/floflis/layers/dna/modules/information-reader.sh ]
then
    . "$PREFIX"usr/lib/floflis/layers/dna/modules/./information-reader.sh
fi
# energy
if [ -f "$PREFIX"usr/lib/floflis/layers/dna/modules/energy.sh ]
then
    . "$PREFIX"usr/lib/floflis/layers/dna/modules/./energy.sh
fi
