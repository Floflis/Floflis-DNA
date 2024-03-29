#!/bin/bash

# Layer: DNA
# Distro: Floflis

# load definitions & settings ---->
chmod +x ./config
. ./config
export FLOPREFIX
export flofmach && export flofdistro && export flofarch && export osfullname && export osname && export osversion && export osbuild && export osbuildcodename && export updatepatch && export year && export layer && export nxtlayer && export distrobase && export user && export specialbuildattempt
# <---- load definitions & settings

# would detect fakeroot 
#for path in ${LD_LIBRARY_PATH//:/ }; do
#   if [[ "$path" == *libfakeroot ]]
#      then
#         echo "You're using fakeroot. Floflis won't work."
#         exit
#fi
#done

is_root=false

if [ "$([[ $UID -eq 0 ]] || echo "Not root")" = "Not root" ]
   then
      is_root=false
   else
      is_root=true
fi

maysudo=""

if [ "$is_root" = "false" ]
   then
      maysudo="sudo"
   else
      maysudo=""
fi

if [[ "$flofmach" == "Termux" ]]; then maysudo="";fi

#dna_ascii=$(cat "$FLOPREFIX"usr/lib/floflis/layers/dna/dna_ascii)
dna_ascii=$(cat dna_ascii)
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


echo "${dna_ascii}"

if [[ "$flofmach" != "Termux" ]]; then
echo "(DEVELOPER/OEM-ONLY) Are you installing into a Cubic chroot? 💫 [Y/n]"
   read cubicmode
   case $cubicmode in
      [nN])
         echo "Ok, its an normal install."
         ;;
      [yY])
         echo "Ok, you're an Floflis developer installing using Cubic! Wonderful 🧚"
         maysudo=""
         $maysudo mkdir /tmp/cubicmode
esac
fi


if [ ! -e "$FLOPREFIX"usr/lib/floflis/layers ]; then echo "- Creating Floflis' Layers folder...";mkdir -p "$FLOPREFIX"usr/lib/floflis/layers; fi
if [ ! -e "$FLOPREFIX"usr/lib/floflis/layers/dna ]; then echo "- Creating folder for Floflis' DNA in "$FLOPREFIX"usr/lib/floflis/layers...";mkdir -p "$FLOPREFIX"usr/lib/floflis/layers/dna; fi
echo "- Installing Floflis' DNA..."
if [ -e layers/soil ]
then
echo "- Copying (probably) a lot of files. Don't worry if it takes several times..."
fi
$maysudo cp -r -f --preserve=all . "$FLOPREFIX"usr/lib/floflis/layers/dna
#task: copy everything except layer's include/ folder
$maysudo mv -f "$FLOPREFIX"usr/lib/floflis/layers/dna/config "$FLOPREFIX"usr/lib/floflis

echo "- Installing Floflis in "$FLOPREFIX"usr/bin..."
$maysudo cat > "$FLOPREFIX"usr/bin/floflis << ENDOFFILE
#!/bin/bash

source "$FLOPREFIX"usr/lib/floflis/layers/dna/floflis
ENDOFFILE

echo "${dna_ascii}"

echo "Do you want to install Floflis' (flo alongside floflis) simplified command? [Y/n]"
read insflo
case $insflo in
   [nN])
      echo "Ok." # floflis command should support installing flo command
      break ;;
   [yY])
      echo "- Installing flo command in "$FLOPREFIX"usr/bin..."
      $maysudo cat > "$FLOPREFIX"usr/bin/flo << ENDOFFILE
#!/bin/bash

source "$FLOPREFIX"usr/lib/floflis/layers/dna/floflis
ENDOFFILE
      echo "- Turning flo command into a executable..."
      $maysudo chmod 755 "$FLOPREFIX"usr/bin/flo && $maysudo chmod +x "$FLOPREFIX"usr/bin/flo
      break ;;
   *)
      echo "${invalid}" ;;
esac
#note: disabling the last "break ;;" resulted in: "install.sh: line 122: syntax error near unexpected token `)'" and "install.sh: line 122: `   *)'"

echo "- Installing Floflis DNA as init program..."
$maysudo mv -f "$FLOPREFIX"usr/lib/floflis/layers/dna/flo-init /etc/init.d
# $maysudo echo "$(cat /tmp/floinstall)" >> /etc/init.d/flo-init
$maysudo chmod 755 /etc/init.d/flo-init && $maysudo update-rc.d flo-init defaults

# knows if layers are present, and install them
if [ -e "$FLOPREFIX"usr/lib/floflis/layers/dna/layers ]
then
   echo "- Layers are here. Detecting..."
# Core>
   if [ -e "$FLOPREFIX"usr/lib/floflis/layers/dna/floflis ]
   then
      if [ -e "$FLOPREFIX"usr/lib/floflis/layers/dna/layers/core ]
      then
         echo "- Preparing to install Core layer..."
         $maysudo rm -r -f "$FLOPREFIX"usr/lib/floflis/layers/core
         $maysudo mv -f "$FLOPREFIX"usr/lib/floflis/layers/dna/layers/core "$FLOPREFIX"usr/lib/floflis/layers
         echo "- Openning Floflis Core installer..."
#         $maysudo chmod +x "$FLOPREFIX"usr/lib/floflis/layers/core/install.sh && cd "$FLOPREFIX"usr/lib/floflis/layers/core && sh ./install.sh
         $maysudo chmod +x "$FLOPREFIX"usr/lib/floflis/layers/core/install.sh && cd "$FLOPREFIX"usr/lib/floflis/layers/core && bash install.sh
fi
fi
# <Core
# Server>
   if [ -e "$FLOPREFIX"usr/lib/floflis/layers/core/floflis ]
   then
      if [ -e "$FLOPREFIX"usr/lib/floflis/layers/dna/layers/server ]
      then
         echo "- Preparing to install Server layer..."
         $maysudo rm -r -f "$FLOPREFIX"usr/lib/floflis/layers/server
         $maysudo mv -f "$FLOPREFIX"usr/lib/floflis/layers/dna/layers/server "$FLOPREFIX"usr/lib/floflis/layers
         echo "- Openning Floflis Server installer..."
#         $maysudo chmod +x "$FLOPREFIX"usr/lib/floflis/layers/server/install.sh && cd "$FLOPREFIX"usr/lib/floflis/layers/server && sh ./install.sh
         $maysudo chmod +x "$FLOPREFIX"usr/lib/floflis/layers/server/install.sh && cd "$FLOPREFIX"usr/lib/floflis/layers/server && bash install.sh
fi
fi
## <Server
## Blockchain>
#   if [ -e "$FLOPREFIX"usr/lib/floflis/layers/core/floflis ]
#   then
#      if [ -e "$FLOPREFIX"usr/lib/floflis/layers/dna/layers/blockchain ]
#      then
#         echo "- Preparing to install Blockchain layer..."
#         $maysudo rm -r -f "$FLOPREFIX"usr/lib/floflis/layers/blockchain
#         $maysudo mv -f "$FLOPREFIX"usr/lib/floflis/layers/dna/layers/blockchain "$FLOPREFIX"usr/lib/floflis/layers
#         echo "- Openning Floflis Blockchain installer..."
##         $maysudo chmod +x "$FLOPREFIX"usr/lib/floflis/layers/blockchain/install.sh && cd "$FLOPREFIX"usr/lib/floflis/layers/blockchain && sh ./install.sh
#         $maysudo chmod +x "$FLOPREFIX"usr/lib/floflis/layers/blockchain/install.sh && cd "$FLOPREFIX"usr/lib/floflis/layers/blockchain && bash install.sh
#fi
#fi
# <Blockchain
# Soil>
   if [ -e "$FLOPREFIX"usr/lib/floflis/layers/core/floflis ]
   then
      if [ -e "$FLOPREFIX"usr/lib/floflis/layers/dna/layers/soil ]
      then
         echo "- Preparing to install Soil layer..."
         $maysudo rm -r -f "$FLOPREFIX"usr/lib/floflis/layers/soil
         $maysudo mv -f "$FLOPREFIX"usr/lib/floflis/layers/dna/layers/soil "$FLOPREFIX"usr/lib/floflis/layers
         echo "- Openning Floflis Soil installer..."
#         $maysudo chmod +x "$FLOPREFIX"usr/lib/floflis/layers/soil/install.sh && cd "$FLOPREFIX"usr/lib/floflis/layers/soil && sh ./install.sh
         $maysudo chmod +x "$FLOPREFIX"usr/lib/floflis/layers/soil/install.sh && cd "$FLOPREFIX"usr/lib/floflis/layers/soil && bash install.sh
fi
fi
# <Soil
# Grass>
   if [ -e "$FLOPREFIX"usr/lib/floflis/layers/soil/floflis ]
   then
      if [ -e "$FLOPREFIX"usr/lib/floflis/layers/dna/layers/grass ]
      then
         echo "- Preparing to install Grass layer..."
         $maysudo rm -r -f "$FLOPREFIX"usr/lib/floflis/layers/grass
         $maysudo mv -f "$FLOPREFIX"usr/lib/floflis/layers/dna/layers/grass "$FLOPREFIX"usr/lib/floflis/layers
         echo "- Openning Floflis Grass installer..."
#         $maysudo chmod +x "$FLOPREFIX"usr/lib/floflis/layers/grass/install.sh && cd "$FLOPREFIX"usr/lib/floflis/layers/grass && sh ./install.sh
         $maysudo chmod +x "$FLOPREFIX"usr/lib/floflis/layers/grass/install.sh && cd "$FLOPREFIX"usr/lib/floflis/layers/grass && bash install.sh
fi
fi
# <Grass
# Base>
   if [ -e "$FLOPREFIX"usr/lib/floflis/layers/grass/floflis ]
   then
      if [ -e "$FLOPREFIX"usr/lib/floflis/layers/dna/layers/base ]
      then
         echo "- Preparing to install Base layer..."
         $maysudo rm -r -f "$FLOPREFIX"usr/lib/floflis/layers/base
         $maysudo mv -f "$FLOPREFIX"usr/lib/floflis/layers/dna/layers/base "$FLOPREFIX"usr/lib/floflis/layers
         echo "- Openning Floflis Base installer..."
#         $maysudo chmod +x "$FLOPREFIX"usr/lib/floflis/layers/base/install.sh && cd "$FLOPREFIX"usr/lib/floflis/layers/base && sh ./install.sh
         $maysudo chmod +x "$FLOPREFIX"usr/lib/floflis/layers/base/install.sh && cd "$FLOPREFIX"usr/lib/floflis/layers/base && bash install.sh
fi
fi
# <Base
# Home>
   if [ -e "$FLOPREFIX"usr/lib/floflis/layers/base/floflis ]
   then
      if [ -e "$FLOPREFIX"usr/lib/floflis/layers/dna/layers/home ]
      then
         echo "- Preparing to install Home layer..."
         $maysudo rm -r -f "$FLOPREFIX"usr/lib/floflis/layers/home
         $maysudo mv -f "$FLOPREFIX"usr/lib/floflis/layers/dna/layers/home "$FLOPREFIX"usr/lib/floflis/layers
         echo "- Openning Floflis Home installer..."
#         $maysudo chmod +x "$FLOPREFIX"usr/lib/floflis/layers/home/install.sh && cd "$FLOPREFIX"usr/lib/floflis/layers/home && sh ./install.sh
         $maysudo chmod +x "$FLOPREFIX"usr/lib/floflis/layers/home/install.sh && cd "$FLOPREFIX"usr/lib/floflis/layers/home && bash install.sh
fi
fi
# <Home
# Ultimate>
   if [ -e "$FLOPREFIX"usr/lib/floflis/layers/home/floflis ]
   then
      if [ -e "$FLOPREFIX"usr/lib/floflis/layers/dna/layers/ultimate ]
      then
         echo "- Preparing to install Ultimate layer..."
         $maysudo rm -r -f "$FLOPREFIX"usr/lib/floflis/layers/ultimate
         $maysudo mv -f "$FLOPREFIX"usr/lib/floflis/layers/dna/layers/ultimate "$FLOPREFIX"usr/lib/floflis/layers
         echo "- Openning Floflis Ultimate installer..."
#         $maysudo chmod +x "$FLOPREFIX"usr/lib/floflis/layers/ultimate/install.sh && cd "$FLOPREFIX"usr/lib/floflis/layers/ultimate && sh ./install.sh
         $maysudo chmod +x "$FLOPREFIX"usr/lib/floflis/layers/ultimate/install.sh && cd "$FLOPREFIX"usr/lib/floflis/layers/ultimate && bash install.sh
fi
fi
# <Ultimate
# Quantum>
   if [ -e "$FLOPREFIX"usr/lib/floflis/layers/ultimate/floflis ]
   then
      if [ -e "$FLOPREFIX"usr/lib/floflis/layers/dna/layers/quantum ]
      then
         echo "- Preparing to install Quantum layer..."
         $maysudo rm -r -f "$FLOPREFIX"usr/lib/floflis/layers/quantum
         $maysudo mv -f "$FLOPREFIX"usr/lib/floflis/layers/dna/layers/quantum "$FLOPREFIX"usr/lib/floflis/layers
         echo "- Openning Floflis Quantum installer..."
#         $maysudo chmod +x "$FLOPREFIX"usr/lib/floflis/layers/quantum/install.sh && cd "$FLOPREFIX"usr/lib/floflis/layers/quantum && sh ./install.sh
         $maysudo chmod +x "$FLOPREFIX"usr/lib/floflis/layers/quantum/install.sh && cd "$FLOPREFIX"usr/lib/floflis/layers/quantum && bash install.sh
fi
# <Quantum
fi
fi
echo "- Turning Floflis into a executable..."
chmod 755 "$FLOPREFIX"usr/bin/floflis && $maysudo chmod +x "$FLOPREFIX"usr/bin/floflis

if [ -e "$FLOPREFIX"usr/sbin/floflis ]
   then
      echo "- Floflis build 071 detected. It uses a old folder structure. Fixing..."
      $maysudo rm -f -r "$FLOPREFIX"usr/sbin/layers && $maysudo rm -f "$FLOPREFIX"usr/sbin/floflis
fi

echo "- Cleanning installers' leftovers..."
$maysudo rm -rf "$FLOPREFIX"usr/lib/floflis/layers/*/include

# supports 'flo' short command
   if [ -e "$FLOPREFIX"usr/bin/flo ]
   then
      flo="flo"
   else
      flo="floflis"
fi

# Detect and store distro type
   if [ -e "$FLOPREFIX"usr/local/bin/*antiX* ]; then
      $maysudo sed -i 's/distrobase="blank"/distrobase="antix"/g' "$FLOPREFIX"usr/lib/floflis/config
fi
   if [ -e "$FLOPREFIX"usr/bin/ubuntu-drivers ]; then
      $maysudo sed -i 's/distrobase="blank"/distrobase="ubuntu"/g' "$FLOPREFIX"usr/lib/floflis/config
fi

$maysudo rm "$FLOPREFIX"usr/lib/floflis/layers/dna/install.sh # no need anymore to use the installer again
$maysudo rm -r "$FLOPREFIX"usr/lib/floflis/layers/dna/layers # as layer are already transfered out of this temporary, built-in folder, it need to be cleared
if [ -e "$FLOPREFIX"usr/lib/floflis/layers/dna/.nostalgit-HAVE-TO-RESTORE ]; then $maysudo rm -r "$FLOPREFIX"usr/lib/floflis/layers/dna/.nostalgit-HAVE-TO-RESTORE;fi
if [ -e /tmp/cubicmode ]; then
   trash-empty
   apt clean all
   apt cache clear
   $maysudo rm -rf /tmp/cubicmode
fi
echo "(✓) Successfully installed. Just type '${flo}' (without quotes) and hit 'enter' button to open it."
