----

# Build 071 (Floflis DNA)

DaniellMesquita@github.com

## Install from IPFS:
Normal: https://gateway.pinata.cloud/ipfs/QmdweQW6FUjvMHCKSz5h7WpMifgzFvh2SFm9T4hiZ6rY4h
Lite: https://gateway.pinata.cloud/ipfs/QmXSiq2atUQeisoiV3PDisNP4LecBCNLv6p6nymvn6JyRL

## Changes

* Init/pre-install executable
* Installer
* Main executable, that loads functionality from layers folder
* Modules (information-reader, energy, update)
* Reads documentation
* Options for shutdown, restart and suspend device
* Updateable

(not working from tag, but 6 updates have fixed it, and the release packages have been also updated)

----

# Build 072 (Floflis DNA)

DaniellMesquita@github.com

## Install from IPFS:
Normal: https://gateway.pinata.cloud/ipfs/QmSxyVaW3MruQ2zQh8UjGE9XugbX1pz8iCYoAV8bViKLoq
Lite: https://gateway.pinata.cloud/ipfs/QmNdMATHet3TnUngY8QfM5vmepQYpWQcPWYGdVbmPDRPP5

## Changes

* install.sh: ask to install `flo` shorter command
* Displays OS name and its build on presentation
* Command to show its version
* CHANGELOG.md
* information-reader: read CHANGELOG.md
* installer.sh: removes install.sh from installed folder
* Fit the FHS (https://en.wikipedia.org/wiki/Filesystem_Hierarchy_Standard) - also fixes bug with build 071, that isn't installing floflis executable
* A lot of minor code fixes
* Detect build 071, and update it
* disables floflis suspend command, for soon implement a alternative to systemctl
* Changed license to GPLv3
* Presentation appears different according to layer
