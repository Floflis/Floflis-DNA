#!/bin/bash
cat << "EOF"
-. .-.   .-. .-.   .-. .-.   .
  \   \ /   \   \ /   \   \ /
 / \   \   / \   \   / \   \
~   `-~ `-`   `-~ `-`   `-~ `-
  _            _           
 |_  |   _   _|_  |  o   _ 
 |   |  (_)   |   |  |  _> 
                           
  ___               _            _   _             
 |_ _|  _ _    ___ | |_   __ _  | | | |  ___   _ _ 
  | |  | ' \  (_-< |  _| / _` | | | | | / -_) | '_|
 |___| |_||_| /__/  \__| \__,_| |_| |_| \___| |_|  

EOF

if [ -e /usr/sbin/layers/dna/LICENSE ]
then
   cat << "EOF"

-. .-.   .-. .-.   .-. .-.   .
  \   \ /   \   \ /   \   \ /
 / \   \   / \   \   / \   \
~   `-~ `-`   `-~ `-`   `-~ `-

EOF
   echo "License with disclaimer:" && echo ""
   cat LICENSE && echo ""
   cat << "EOF"

-. .-.   .-. .-.   .-. .-.   .
  \   \ /   \   \ /   \   \ /
 / \   \   / \   \   / \   \
~   `-~ `-`   `-~ `-`   `-~ `-

EOF
   echo "Do you agree with the license and the disclaimer? Please scroll up to read."
   echo "PLEASE READ AND WRITE CAREFULLY!"
   echo "1 = YES, I agree with the LICENSE and the DISCLAIMER"
   echo "2 = NO, I do not agree"
   echo "Please reply by typping a number (according to your choice) and press [ENTER]"
   read licenseagreement
   if [ "$licenseagreement" = "1" ]; then
      echo "Ok, thank you."
fi
   if [ "$licenseagreement" = "2" ]; then
      exit
fi
fi

echo "- Installing Floflis in /usr/sbin..."
sudo cat > /usr/sbin/floflis << ENDOFFILE
#!/bin/bash
source /usr/sbin/layers/dna/floflis
ENDOFFILE
echo "- Creating Floflis' Layers folder..."
sudo mkdir /usr/sbin/layers
echo "- Creating folder for Floflis' DNA in /usr/sbin/layers..."
sudo mkdir /usr/sbin/layers/dna
echo "- Installing Floflis' DNA..."
sudo cp -r . /usr/sbin/layers/dna
echo "- Turning Floflis into a executable..."
sudo chmod 755 /usr/sbin/floflis
echo "(✓) Successfully installed. Just type 'floflis' (without quotes) and hit 'enter' button to open it."
