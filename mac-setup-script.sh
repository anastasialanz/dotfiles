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
