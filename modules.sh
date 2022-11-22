#!/bin/bash

# information-reader
if [ -e /usr/lib/floflis/layers/dna/modules/information-reader.sh ]
then
    . /usr/lib/floflis/layers/dna/modules/information-reader.sh
fi
# energy
if [ -e /usr/lib/floflis/layers/dna/modules/energy.sh ]
then
    . /usr/lib/floflis/layers/dna/modules/energy.sh
fi
