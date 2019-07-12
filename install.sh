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

# install Floflis tree folder/subsystem

echo "(✓) Successfully installed. Just type 'floflis' (without quotes) and hit 'enter' button to open it."
