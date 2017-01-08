#!/usr/bin/env bash

# Install command-line tools using Homebrew

# use the latest homebrew
brew update

# upgrade any installed formulae
brew upgrade

# install GNU core utilities
brew install coreutils

# install other tools
brew install vim --with-override-system-vi



# remove outdated version from the cellar
brew cleanup
