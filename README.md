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

## Installing

Assuming `Floflis DNA` folder is on the target device, run the following command inside this folder:

```sh
sudo chmod +x install.sh && sudo sh ./install.sh
```


Insert your password, and Floflis will be installed.

## Updating

Update from P2P network (not available yet in DNA):

```sh
floflis update
```

Update from GitLab:

```sh
floflis update --gitlab
```

Update from GitHub:

```sh
floflis update --github
```

* config file doesn't anymore depends on a specific layer (previously depending upon DNA Layer)
* in config, show build/version's year
* no need to upgrade again when installing/updating DNA Layer?
* only remove install.sh after sure it's installed
* Detect OS, Distro and CPU Arch

## To do

* tell when install.sh isn't exec as root
* don't say on script it is success without reading output from script (for example, "fatal: unable to access 'https://gitlab.com/Floflis/Floflis-DNA.git/': Could not resolve host: gitlab.com")
* if "sudo: git: command not found" install git
* install.sh: detect attached layers and install them
* (fix) install.sh: only show license/disclaimer if reader module is available (license/disclaimer is considered as already agreed when user explicitly agrees and removes information-reader module)
* Floflis DNA installer runs Core's own installer
* update Floflis DNA from local network device
* init.sh shows the amount of disk space have been reduced
* append DNA changelog with Core changelog
* saved commands (`git add . && git commit -m "Update README.md" && git push origin && git push github` | `ssh chat.shazow.net` | `sudo apt update && sudo apt upgrade -y && sudo apt-get -y install swig3.0 python3-dev python3-pip build-essential cmake pkg-config libssl-dev libffi-dev libhwloc-dev libboost-dev && sudo apt update`)
* list the biggest programs/packages
* remove bloatware
* download updates from a Core+ device, apply to a DNA device
* themes
* receive updates from native dat (when it is available)
* GitLab releases
* suggest to download upgrade from IPFS
* option to remove/uninstall modules and features, such as `flo`
* upgrade module instead of relying on `floflis` (install.sh will also use it)
* modular changelog
* detect a installation that were canceled without user asking
