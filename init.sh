#!/bin/bash

ok="Ok, going to the next question."

cat << "EOF"

-. .-.   .-. .-.   .-. .-.   .
  \   \ /   \   \ /   \   \ /
 / \   \   / \   \   / \   \
~   `-~ `-`   `-~ `-`   `-~ `-

EOF
echo "Welcome! Before adding that folder (Floflis DNA) to your device, we need to configure the install, to make it more lightweight."
echo ""
echo "We will ask some questions and configure according to your answers. Please reply by typping a number (according to your choice) and press [ENTER]."
cat << "EOF"

-. .-.   .-. .-.   .-. .-.   .
  \   \ /   \   \ /   \   \ /
 / \   \   / \   \   / \   \
~   `-~ `-`   `-~ `-`   `-~ `-

EOF
echo "The first question. Do you want to update Floflis DNA from git (GitLab, GitHub) or manually? (P2P updates aren't supported, yet)"
echo "Installing without git makes it lightweight (ideal for routers and other limited devices), but will require manual effort like you're doing now."
echo "Update module and .git folder haves approx. 349.2 KB of disk usage."
echo "How do you want to update Floflis?"
echo "1 = FROM GIT"
echo "2 = MANUALLY"
read gitormanual
if [ "$gitormanual" = "1" ]; then
   echo "$ok"
fi
if [ "$gitormanual" = "2" ]; then
   echo "Removing .git folder..."
   sudo rm -r .git
   echo "Removing update module..."
   sudo rm modules/update
   echo "$ok"
fi
# if [ "$gitormanual" != "1" ] || [ "$gitormanual" != "2" ]; then
#    echo "PEEEH!"
#    echo "$gitormanual isn't a valid answer (as we've asked 1 or 2). Restarting..."
#    sudo ./init.sh && exit
# fi
cat << "EOF"

-. .-.   .-. .-.   .-. .-.   .
  \   \ /   \   \ /   \   \ /
 / \   \   / \   \   / \   \
~   `-~ `-`   `-~ `-`   `-~ `-

EOF
echo "Do you know how to turn off/restart/suspend Linux?"
echo "You can have the convenience to do it with 'floflis shu/sus/res' commands."
echo "But, if you don't want the 1,5 KB of the Floflis' energy module and knows how to do it from Linux:"
echo ""
echo "1 = KEEP energy MODULE"
echo "2 = REMOVE energy MODULE"
read keepenergymod
if [ "$keepenergymod" = "1" ]; then
   echo "$ok"
fi
if [ "$keepenergymod" = "2" ]; then
   echo "Removing energy module..."
   sudo rm modules/energy
   echo "$ok"
fi
# if [ "$keepenergymod" != "1" ] || [ "$keepenergymod" != "2" ]; then
#    echo "PEEEH!"
#    echo "$keepenergymod isn't a valid answer (as we've asked 1 or 2). Restarting..."
#    sudo ./init.sh && exit
# fi

cat << "EOF"

-. .-.   .-. .-.   .-. .-.   .
  \   \ /   \   \ /   \   \ /
 / \   \   / \   \   / \   \
~   `-~ `-`   `-~ `-`   `-~ `-

EOF
echo "Floflis DNA contains README.md, LICENSE, CONTRIBUTING, DISCLAIMER and CODE_OF_CONDUCT."
echo "Do you want to remove them? Due to responsibility, we will show LICENSE and DISCLAIMER and ask you to confirm your agreement."
echo "Do you want the documentation?"
echo "Documentation and information-reader module haves approx. 6.6 KB of disk usage."
echo "1 = KEEP documentation"
echo "2 = REMOVE documentation and information-reader module"
read keepdocumentation
if [ "$keepdocumentation" = "1" ]; then
   echo "$ok"
fi
if [ "$keepdocumentation" = "2" ]; then
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
   echo "Before removing documentation..."
   echo "Do you agree with the license and the disclaimer? Please scroll up to read."
   echo "PLEASE READ AND WRITE CAREFULLY!"
   echo "1 = YES, I agree with the LICENSE and the DISCLAIMER"
   echo "2 = NO, I do not agree"
   read licenseagreement
   if [ "$licenseagreement" = "1" ]; then
      echo "Removing README.md" && sudo rm README.md
      echo "Removing LICENSE file" && sudo rm LICENSE
      echo "Removing CONTRIBUTING file" && sudo rm CONTRIBUTING
      echo "Removing DISCLAIMER file" && sudo rm DISCLAIMER
      echo "Removing CODE_OF_CONDUCT.md" && sudo rm CODE_OF_CONDUCT.md
      echo "Removing information-reader module" && sudo rm modules/information-reader
fi
   if [ "$licenseagreement" = "2" ]; then
      exit
fi
fi
cat << "EOF"

-. .-.   .-. .-.   .-. .-.   .
  \   \ /   \   \ /   \   \ /
 / \   \   / \   \   / \   \
~   `-~ `-`   `-~ `-`   `-~ `-

EOF
echo "Done! Now, you can move this folder to the device you want to install Floflis, and run install.sh using 'sudo chmod 755 install.sh && sudo ./install.sh' command (without quotes)."
sudo rm init.sh
