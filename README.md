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

[Site](https://floflis.github.io/) | [Download](https://floflis.github.io/download/) | [Blog](https://floflis.github.io/blog/) | [Manuals/documentation](https://floflis.github.io/docs/) | [Peepeth](https://peepeth.com/floflis) | [Twitter](https://twitter.com/FloflisOS) | [Developers](https://floflis.github.io/docs/dev/) | [Sources](https://floflis.github.io/source/)

# Floflis DNA

The heart of Floflis, 100% CLI.

Can evolve to Core and even graphical versions (not available yet).

Subscribe to [our blog](https://floflis.github.io/blog/) for news.

## Downloading

You can download a packaged release [here](https://github.com/Floflis/Floflis-DNA/releases/download/071/Floflis.DNA.tar.gz).

Lite version (needs manual update) [here](https://github.com/Floflis/Floflis-DNA/releases/download/071/Floflis.DNA.Lite.tar.gz).

If you need the source, please don't directly download the source; clone it. (you can download as compressed file, but you will need manual work to update Floflis, like on the Lite version).

For more details, visit our [downloads page](https://floflis.github.io/download/).

## Before installing

**Note**: You can skip this step if your device haves enough storage space available. If the target device is limited (like a WiFi router), this pre-install step will be needed, except when you'd already downloaded the Lite version.

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

* as update module is moved, remove .git folder on init.sh
* install.sh copy each file instead of all, except .git
* init.sh shows the amount of disk space have been reduced
* CHANGELOG
* read OS info
* build watermark
* saved commands
* `flo` shorter command
* upgrade to Core

* list the biggest programs/packages
* remove bloatware
* download updates from a Core+ device, apply to a DNA device
* themes
* receive updates from native dat (when it is available)
* GitLab releases
* Dat releases
* ZN releases
