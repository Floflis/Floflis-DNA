#!/bin/bash

# information-reader
if [ -f "$FLOPREFIX"usr/lib/floflis/layers/dna/modules/information-reader.sh ]
then
    . "$FLOPREFIX"usr/lib/floflis/layers/dna/modules/./information-reader.sh
fi
# energy
if [ -f "$FLOPREFIX"usr/lib/floflis/layers/dna/modules/energy.sh ]
then
    . "$FLOPREFIX"usr/lib/floflis/layers/dna/modules/./energy.sh
fi
