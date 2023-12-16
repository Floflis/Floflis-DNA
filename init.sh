#!/bin/bash

ok="Ok, going to the next question."
invalid="Please enter a valid input"

read -r -d '' dna_ascii << "EOF"

-. .-.   .-. .-.   .-. .-.   .
  \   \ /   \   \ /   \   \ /
 / \   \   / \   \   / \   \
~   `-~ `-`   `-~ `-`   `-~ `-

EOF
echo "Initializing..."
#https://github.com/FilePeace/webpresent
webpresent init -r
echo "${dna_ascii}"

echo "Welcome! Before adding that folder (Floflis DNA) to your device, we need to configure the install, to make it more lightweight."
echo "- Removing .git folder..."
sudo rm -r .git
echo ""
echo "Ok."
echo "We will ask some questions and configure according to your answers. Please reply by typing y/n (according to your choice) and press [ENTER]."

echo "${dna_ascii}"

echo "The first question. Do you know how to turn off/restart/suspend Linux?"
echo "You can have the convenience to do it with 'floflis shu/sus/res' commands."
echo "But, if you don't want the 1,5 KB of the Floflis' energy module and knows how to do it from Linux:"
echo ""
echo "Use energy module? [Y/n]"
while true; do
read keepenergymod
case $keepenergymod in
   [nN])
       echo "Removing energy module..."
       rm modules/energy.sh
       echo "${ok}"
       break ;;
   [yY])
       echo "${ok}" ;;
   *)
       echo "${invalid}";;
esac
done
echo "${dna_ascii}"

echo "Floflis DNA contains README.md, LICENSE, CONTRIBUTING, DISCLAIMER and CODE_OF_CONDUCT."
echo "Do you want to remove them? Due to responsibility, we will show LICENSE and DISCLAIMER and ask you to confirm your agreement."
echo "Do you want the documentation?"
echo "Documentation and information-reader module haves approx. 6.6 KB of disk usage."
echo "Keep documentation? [Y/n]"
read keepdocumentation

echo "${dna_ascii}"
echo "License with disclaimer:" && echo ""
cat LICENSE && echo ""
echo "${dna_ascii}"

echo "Before removing documentation..."
echo "Do you agree with the license and the disclaimer? Please scroll up to read."
echo "PLEASE READ AND WRITE CAREFULLY!"
echo "Do you agree to the license? [Y/n]"
while true; do
read licenseagreement
case $licenseagreement in
   [nN])
      echo "You need to agree to the license in order to use Floflis."
      exit;;
   [yY])
      echo "Removing README.md" && rm README.md
      echo "Removing LICENSE file" && rm LICENSE
      echo "Removing CONTRIBUTING file" && rm CONTRIBUTING
      echo "Removing DISCLAIMER file" && rm DISCLAIMER
      echo "Removing CODE_OF_CONDUCT.md" && rm CODE_OF_CONDUCT.md
      echo "Removing information-reader module" && rm modules/information-reader.sh
      break ;;
   *)
      echo "${invalid}" ;;
esac
done
   
echo "${dna_ascii}"

echo "Done! Now, you can move this folder to the device you want to install Floflis, and run install.sh using 'sudo chmod +x install.sh && sudo ./install.sh' command (without quotes)."
rm init.sh
