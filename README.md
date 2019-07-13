```
0===0
 O=o
  O
 o=O
0===0
 O=o     -. .-.   .-. .-.   .-. .-.   .
  O        \   \ /   \   \ /   \   \ /
 o=O      / \   \   / \   \   / \   \
0===0    ~   `-~ `-`   `-~ `-`   `-~ `-
 O=o
  O
 o=O       _            _           
0===0     |_  |   _   _|_  |  o   _
 O=o      |   |  (_)   |   |  |  _>
  O
 o=O         __| |_ __   __ _ 
0===0       / _` | '_ \ / _` |
 O=o       | (_| | | | | (_| |
  O         \__,_|_| |_|\__,_|
 o=O
0===0
 O=o
  O
 o=O
0===0
```

# Floflis DNA

The heart of Floflis, 100% CLI.

Can evolve to Core and even graphical versions (not available yet).

Subscribe to [our blog](https://floflis.github.io/blog/) for news.

## Downloading

You can download a packaged release [here](https://github.com/Floflis/Floflis-DNA/releases/download/071/Floflis.DNA.tar.gz).

If you need the source, please don't directly download the source; clone it. (you can download as compressed file, but you will need manual work to update Floflis).

For more details, visit our [downloads page](https://floflis.github.io/download/).

## Before installing

**Note**: You can skip this step if your device haves enough storage space available. If the target device is limited (like a WiFi router), this pre-install step will be needed.

If you wish to remove the updates module (which includes .git folder), please copy the `Floflis DNA` folder, so you will have a copy which you can update (`git pull`).

Inside the clonned/downloaded extracted folder, open Terminal and type the following:

```bash
sudo chmod 755 init.sh && sudo ./init.sh
```

Respond to questions and the script will configure the installer for you.
After done, you can move the `Floflis DNA` folder to your device.

## Installing

Assuming `Floflis DNA` folder is on the target device, run the following command inside this folder:

```bash
sudo chmod 755 install.sh && sudo ./install.sh
```

Insert your password, and Floflis will be installed.

## Updating

Update from P2P network (not available yet in DNA):

```bash
floflis update
```

Update from GitLab (not working yet because GitLab is asking for login, and they didn't replied yet to our issue):

```bash
floflis update --gitlab
```

Update from GitHub:

```bash
floflis update --github
```

## To do

* link to blog
* downloads page
* packaged release
* update from GitLab
* script to remove proprietary blobs from kernel
* list the biggest programs/packages
* remove bloatware
* init.sh shows the amount of disk space have been reduced
* download updates from a Core+ device, apply to a DNA device
* upgrade to Core
* saved commands
* themes
* receive updates from native dat (when it is available)
* install CLI software from Substratum and other layers
* `floflis update -h` command
* modules as git submodules?
