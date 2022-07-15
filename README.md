# aur packager for bpkg

packager for [bpkg](https://github.com/bpkg/bpkg) on [bpkg-git](https://aur.archlinux.org/packages/bpkg-git)

Continous integration package maintainer for [bpkg](https://github.com/bpkg/bpkg) on the Arch User Repository.

### Requiments

Requires `makepkg` from the `pacman` package to make a `.SRCINFO` file

### Installation

1. `echo "Cloning package" && git clone https://github.com/richard-muvirimi/aur-package-bpkg`
2. `echo "Switch to directory" && cd "aur-package-bpkg"`
3. `echo "Run script" && sh maintain.sh`

Maybe setting up a crontab to watch the upstreem repository.
