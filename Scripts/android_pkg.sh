#!/bin/bash
pkg install vim
pkg install util-linux
pkg install stow
pkg install zsh
pkg install pass
pkg install neofetch
pkg install python
pkg install man
pkg install newsboat
pkg install ctags
pkg install rsync

# to allow termux to access your existing directories, particularly /storage/emulated/0
# this creates a new directory in termux, ~/storage, which contains simlinks to /storage/emulated/0
termux-setup-storage
