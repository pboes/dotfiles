#!/usr/bin/env zsh

# path to this directory:
export ZSH_CUSTOM=~/.dotfiles/zsh

# load .zsh files from the above dir in this order:
for _dotzsh in "$ZSH_CUSTOM"/custom/{common,env,path,aliases,functions,plugins}.zsh; do
  if [[ -f "$_dotzsh" ]]; then
    source "$_dotzsh"
  fi
done
unset _dotzsh

# macos.zsh has aliases, functions, etc specific to macOS:
if [[ "$OSTYPE" = "darwin"* ]] && [[ -f "$ZSH_CUSTOM"/custom/macos.zsh ]]; then
  source "$ZSH_CUSTOM"/custom/macos.zsh
fi

if [[ -f ~/.zshrc.local ]]; then
  source ~/.zshrc.local
fi


# bun
export BUN_INSTALL="$HOME/Library/Application Support/reflex/bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Created by `pipx` on 2024-03-15 22:04:42
export PATH="$PATH:/Users/paulboes/.local/bin"

# Add MariaDB path
export PATH="/usr/local/Cellar/mariadb@10.6/10.6.17/bin:$PATH"
export GPG_TTY=/dev/ttys000
