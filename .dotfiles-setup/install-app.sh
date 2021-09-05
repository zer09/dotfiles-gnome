#!/bin/bash

# exit on first error
set -e

err_report() {
	echo "Error on line $1"
}

trap "err_report $LINENO" ERR

GITSOURCES="$HOME/gitsources"
mkdir -p $GITSOURCES
rm -rf $GITSOURCES/*

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# browser
pamac install --no-confirm chromium google-chrome

# essential
# fzf To utilize, add the following to your bash config: `. /etc/profile.d/fzf.bash`
pamac install --no-confirm noto-fonts-emoji powerline-fonts profile-sync-daemon ripgrep fd bat starship ranger-git fzf-git pspg unzip bash-completion shfmt

# install z jump
cd $GITSOURCES && git clone git@github.com:rupa/z.git

# install bat-extras
cd $GITSOURCES && git clone git@github.com:eth-p/bat-extras.git
cd bat-extras && sudo ./build.sh --minify=all --install

# software development
pamac install --no-confirm neovim-nightly-bin gitflow-avh gitahead percona-server-clients percona-server mysql-workbench

# ranger requirements
pamac install --no-confirm ffmpegthumbnailer epub-thumbnailer-git
