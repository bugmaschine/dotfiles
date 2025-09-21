#!/bin/bash

# Exit on error
set -e

DOTFILES_DIR="$HOME/dotfiles"
ZSH_CUSTOM="$HOME/.oh-my-zsh"

echo "installing zsh..."
sudo pacman -Syu --noconfirm zsh git curl

if [ ! -d "$ZSH_CUSTOM" ]; then
    echo "installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    sh -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
else
    echo "Oh My Zsh already installed"
fi



echo "linking..."
ln -sf "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"

echo "done"
