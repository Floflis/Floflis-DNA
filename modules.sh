#!/bin/bash

# information-reader
if [ -f /usr/lib/floflis/layers/dna/modules/information-reader.sh ]
then
    . /usr/lib/floflis/layers/dna/modules/./information-reader.sh
fi
# energy
if [ -f /usr/lib/floflis/layers/dna/modules/energy.sh ]
then
    . /usr/lib/floflis/layers/dna/modules/./energy.sh
fi
