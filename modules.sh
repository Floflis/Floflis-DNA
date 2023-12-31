#!/bin/bash

export FLOPREFIX
export flofmach && export flofdistro && export flofarch && export osfullname && export osname && export osversion && export osbuild && export osbuildcodename && export updatepatch && export year && export layer && export nxtlayer && export distrobase && export user && export specialbuildattempt

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
