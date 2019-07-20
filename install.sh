#!/bin/sh

read -r -d '' dna_ascii <<EOF
 
-. .-.   .-. .-.   .-. .-.   .
  \   \ /   \   \ /   \   \ /
 / \   \   / \   \   / \   \
~   `-~ `-`   `-~ `-`   `-~ `-

EOF

echo "${dna_ascii}"

cat << EOF  
  _            _
 |_  |   _   _|_  |  o   _ 
 |   |  (_)   |   |  |  _> 
                           
  ___               _            _   _             
 |_ _|  _ _    ___ | |_   __ _  | | | |  ___   _ _ 
  | |  | ' \  (_-< |  _| / _` | | | | | / -_) | '_|
 |___| |_||_| /__/  \__| \__,_| |_| |_| \___| |_|  

EOF

echo "${dna_ascii}"
echo "License with disclaimer:" && echo ""
cat LICENSE && echo ""

echo "${dna_ascii}"
echo "Do you agree with the license and the disclaimer? Please scroll up to read [Y/n]"
while true; do
   read licenseagreement
   case $licenseagreement in
       [nN])
	   exit ;;
       [yY])
	   echo "Ok"
fi

echo "- Installing Floflis in /usr/bin..."
sudo cat > /usr/bin/floflis << ENDOFFILE
#!/bin/bash
source /usr/bin/layers/dna/floflis
ENDOFFILE
echo "- Creating Floflis' Layers folder..."
mkdir -p /usr/lib/floflis/layers
echo "- Creating folder for Floflis' DNA in /usr/lib/floflis/layers..."
mkdir -p /usr/lib/floflis/layers/dna
echo "- Installing Floflis' DNA..."
cp -r --preserve=all . /usr/lib/floflis/layers/dna
echo "- Turning Floflis into a executable..."
chmod 755 /usr/bin/floflis
echo "(✓) Successfully installed. Just type 'floflis' (without quotes) and hit 'enter' button to open it."
