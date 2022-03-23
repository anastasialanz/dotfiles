#!/bin/bash

echo "Starting setup"

echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

PACKAGES=(
  cmake
  git
  git-secrets
  jq
  the_silver_searcher
  vim
  zsh
)

echo "Installing packages..."
brew install ${PACKAGES[@]}

echo "Installing cask..."

CASKS=(
  1password
  alfred
  charles
  docker
  firefox
  google-chrome
  hyper
  paw
  skitch
  slack
  spotify
  visual-studio-code
  zoom
)

echo "Installing cask apps..."
brew install --cask ${CASKS[@]}

echo "Setup oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Setup Dotfiles"
if [ ! -d ~/dotfiles ]; then
  git clone git@github.com:anastasialanz/dotfiles.git ~/dotfiles
fi

cd ~/dotfiles

for link in .gitconfig .gitignore_global .gitmessage .zshrc .zprofile; do
  if [ -L "$HOME/$link" ]; then
    echo "Link '$link' exists"
  else
    ln -s "$PWD/$link" "$HOME/$link"
  fi
done

echo "Setup NVM"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
