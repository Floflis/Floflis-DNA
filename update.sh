#!/bin/bash

source /usr/lib/floflis/config #need to work/experimental

is_root=false

if [ "$([[ $UID -eq 0 ]] || echo "Not root")" = "Not root" ]
   then
      is_root=false
   else
      is_root=true
fi

$maysudo=""

if [ "$is_root" = "false" ]
   then
      $maysudo="sudo"
   else
      $maysudo=""
fi

dna_ascii=""" 
-. .-.   .-. .-.   .-. .-.   .
  \   \ /   \   \ /   \   \ /
 / \   \   / \   \   / \   \
~   `-~ `-`   `-~ `-`   `-~ `-
"""
#
echo "${dna_ascii}"
#
cat << "EOF"

  _            _           
 |_  |   _   _|_  |  o   _ 
 |   |  (_)   |   |  |  _>  
           
           Update

EOF

echo "Updating Floflis to FU$updatepatch+1..." #need to work/experimental

if [ "$updatepatch" = "0" ]; then
   echo "Updating config file to register FU$updatepatch+1 update..." #need to work/experimental
   $maysudo sed -i 's/updatepatch="0"/updatepatch="1"/g' /usr/lib/floflis/config
   echo "(✓) Success! Your Floflis has been updated."
fi
