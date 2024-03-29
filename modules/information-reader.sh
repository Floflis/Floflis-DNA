#!/bin/bash
if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
#todo:
#  echo "   license                     Shows Floflis' license file"
#  echo "   disclaimer                  Shows Floflis' disclaimer file"
   echo "   coc                         Shows Floflis' Code of Conduct"
   echo "   changelog                   Shows Floflis' CHANGELOG"
fi

# todo:
# if [ \( "$1" = "license" \) -o \( "$2" = "" \) ]; then
#    cat LICENSE
# fi

# if [ \( "$1" = "license" \) -o \( "$2" = "-d" \) ] || [ "$1" = "disclaimer" ]; then
#    cat DISCLAIMER
# fi

# if argument 1 is license and 2 is disclaimer, or argument 1 is disclaimer, show it
# if [ \( "$g" -eq 1 -a "$c" = "123" \) -o \( "$g" -eq 2 -a "$c" = "456" \) ]
# then echo abc
# else echo efg
# fi

if [ "$1" = "codeofconduct" ] || [ "$1" = "conductcode" ] || [ "$1" = "coc" ] || [ "$1" = "--coc" ]; then
   echo "Floflis' Code of Conduct:"
   cat "$FLOPREFIX"usr/lib/floflis/layers/dna/CODE_OF_CONDUCT.md
fi

if [ "$1" = "changelog" ] || [ "$1" = "CHANGELOG" ]; then
   echo "Floflis' CHANGELOG:"
   cat "$FLOPREFIX"usr/lib/floflis/layers/dna/CHANGELOG.md
fi
