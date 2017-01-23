#!/usr/bin/env bash

# Install command-line tools using Homebrew

# use the latest homebrew
brew update

# upgrade any installed formulae
#brew upgrade

# install GNU core utilities
#brew install coreutils

# install other tools
brew install vim --with-override-system-vi
brew cask install iterm2
brew install zsh
brew install zsh-completions
brew install ack
# installing oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# installing powerline fonts
git clone https://github.com/powerline/fonts.git
./fonts/install.sh
rm -rf fonts

# remove outdated version from the cellar
brew cleanup
