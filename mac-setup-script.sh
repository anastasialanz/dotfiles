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
  harvest
  hyper
  microsoft-teams
  paw
  skitch
  slack
  spotify
  visual-studio-code
  zoom
)

echo "Installing cask apps..."
brew install --cask ${CASKS[@]}
