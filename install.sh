#!/bin/bash
# . config

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
                           
  ___               _            _   _             
 |_ _|  _ _    ___ | |_   __ _  | | | |  ___   _ _ 
  | |  | ' \  (_-< |  _| / _` | | | | | / -_) | '_|
 |___| |_||_| /__/  \__| \__,_| |_| |_| \___| |_|  

                  for Floflis DNA

EOF

echo "${dna_ascii}"
echo "License with disclaimer:" && echo ""
cat LICENSE && echo ""

if [ -e LICENSE ]
   then
      echo "${dna_ascii}"
      echo "License with disclaimer:" && echo ""
      cat LICENSE && echo ""
      echo "${dna_ascii}"
      echo "Scroll up to read. PLEASE READ/WRITE CAREFULLY!"
      echo "Do you agree with the license and the disclaimer? [Y/n]"
         read licenseagreement
         case $licenseagreement in
            [nN])
               exit ;;
            [yY])
               echo "Ok"
         esac
fi

echo "- Installing Floflis in /usr/bin..."
sudo cat > /usr/bin/floflis << ENDOFFILE
#!/bin/bash

source /usr/lib/floflis/layers/dna/floflis
ENDOFFILE

echo "Do you want to install Floflis' (flo alongside floflis) simplified command? [Y/n]"
read insflo
case $insflo in
   [nN])
      echo "Ok." # floflis command should support installing flo command
      exit;;
   [yY])
      echo "- Installing flo command in /usr/bin..."
      sudo cat > /usr/bin/flo << ENDOFFILE
#!/bin/bash

source /usr/lib/floflis/layers/dna/floflis
ENDOFFILE
      echo "- Turning flo command into a executable..."
      sudo chmod 755 /usr/bin/flo && sudo chmod +x /usr/bin/flo
      break ;;
   *)
      echo "${invalid}" ;;
esac

echo "- Creating Floflis' Layers folder..."
mkdir -p /usr/lib/floflis/layers
echo "- Creating folder for Floflis' DNA in /usr/lib/floflis/layers..."
mkdir -p /usr/lib/floflis/layers/dna
echo "- Installing Floflis' DNA..."
sudo cp -r --preserve=all . /usr/lib/floflis/layers/dna
sudo rm /usr/lib/floflis/layers/dna/install.sh
# knows if layers are present, and install them
if [ -e /usr/lib/floflis/layers/dna/layers ]
then
   echo "- Layers are here. Detecting..."
# <Core
   if [ -e /usr/lib/floflis/layers/dna/layers/core ]
   then
      echo "- Preparing to install Core layer..."
      sudo mv -f /usr/lib/floflis/layers/dna/layers/core /usr/lib/floflis/layers
      echo "- Openning Floflis Core installer..."
      cd /usr/lib/floflis/layers/core && sudo chmod 755 core && sh ./core
fi
# Core>
fi
echo "- Turning Floflis into a executable..."
chmod 755 /usr/bin/floflis && sudo chmod +x /usr/bin/floflis

if [ -e /usr/sbin/floflis ]
   then
      echo "- Floflis build 071 detected. It uses a old folder structure. Fixing..."
      sudo rm -f -r /usr/sbin/layers && sudo rm -f /usr/sbin/floflis
fi

# supports 'flo' short command
   if [ -e /usr/bin/flo ]
   then
      flo="flo"
   else
      flo="floflis"
fi

echo "(✓) Successfully installed. Just type '${flo}' (without quotes) and hit 'enter' button to open it."
