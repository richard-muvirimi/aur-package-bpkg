#!/usr/bin/env bash

# Builds bpkg package and pushes to the aur

set -eo 

echo "bpkg maintainer"

WORKING_ROOT="$PWD"

echo "Create temp directory"
WORKING_DIRECTORY=$(mktemp -d -p "$WORKING_ROOT")

echo "Change to temp directory"
cd "$WORKING_DIRECTORY"

git clone ssh://aur@aur.archlinux.org/bpkg-git.git 

git clone https://github.com/bpkg/bpkg.git

cd "$WORKING_DIRECTORY/bpkg"

BPKG_VERSION="$(git describe --tags $(git rev-list --tags --max-count=1))"
echo "Version is: $BPKG_VERSION"

cd "$WORKING_DIRECTORY/bpkg-git"

echo "Set new version"
sed -i "s/pkgver=\w+/$BPKG_VERSION/" PKGBUILD

echo "Make source information file"
makepkg --printsrcinfo > .SRCINFO    

git config --local user.email "rich4rdmuvirimi@gmail.com"
git config --local user.name "Richard Muvirimi"
git add -A

if [ -z "$(git status | grep 'nothing to commit')" ]; then

    echo "Deploy Release $BPKG_VERSION"

    git commit -m "Release $BPKG_VERSION" -a
    git push
else
    echo "Skip Deploy Release $BPKG_VERSION"
fi

cd "$WORKING_ROOT"

echo "Cleaning up..."
rm -rf "$WORKING_DIRECTORY"