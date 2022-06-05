#!/usr/bin/env bash

# Fish is not available until after brew installs it, so we start with a bash shell script

./brew.sh
./bootstrap.fish
./setup-fish.fish
./python-dev.fish
./macos-defaults.fish
./dock.fish
./volta.fish
