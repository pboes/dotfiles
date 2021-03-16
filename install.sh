#!/usr/bin/env bash

set -euo pipefail

# what a mess. https://stackoverflow.com/a/53183593
YOU_ARE_HERE="$(realpath "$(dirname "${BASH_SOURCE[0]}")")"

echo "👋  Deep breaths, everything will (probably) be fine!"

# Ask for the administrator password upfront
sudo -v

# Clone this repo if we haven't already
git clone --recurse-submodules https://github.com/jakejarvis/dotfiles.git "$YOU_ARE_HERE" || true

# Set up symbolic links for ZSH and Git pointing to this cloned repo
ln -sf "$YOU_ARE_HERE/zsh/.zshrc" ~/.zshrc
ln -sf "$YOU_ARE_HERE/git/.gitconfig" ~/.gitconfig
ln -sf "$YOU_ARE_HERE/git/.gitignore_global" ~/.gitignore_global
mkdir -p ~/.ssh
ln -sf "$YOU_ARE_HERE/ssh/.ssh/config" ~/.ssh/config

# Suppress terminal login banners
touch ~/.hushlogin

# https://github.com/ohmyzsh/ohmyzsh/issues/6835#issuecomment-390187157
chmod 755 /opt/homebrew/share/zsh
chmod 755 /opt/homebrew/share/zsh/site-functions

# Get Oh My ZSH up and running
if [ ! -e ~/.oh-my-zsh ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# Use Git submodules to get OMZ plugins
git submodule update --init --recursive

if [ "$(uname)" == "Darwin" ]; then
  # shellcheck disable=SC1090,SC1091
  source "$YOU_ARE_HERE/macos/macos.sh"
else
  echo ""
  echo "This isn't a Mac, so we're all done here!"
  echo "Logout/restart now for the full effects."
  exit 0
fi
