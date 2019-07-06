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
echo "Installing Floflis' DNA in /usr/sbin.."
sudo cp floflis /usr/sbin
echo "Making Floflis DNA into a executable.."
sudo chmod 755 /usr/sbin/floflis
echo "Successfully installed. Just type 'floflis' (without quotes) to open it."
# ask if want to open it after installed
