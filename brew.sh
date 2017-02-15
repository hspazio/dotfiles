#!/usr/bin/env bash

# Install command-line tools using Homebrew

# use the latest homebrew
brew update

# upgrade any installed formulae
#brew upgrade

# install GNU core utilities
brew install coreutils

# install other tools
brew install vim --with-override-system-vi
brew cask install iterm2
brew install zsh
brew install zsh-completions

# search tools
brew install ack
brew install the_silver_searcher

# vim ctags
brew install ctags
gem install gem-ctags # make ctags working with bundler and gems
gem ctags             # index automatically any new gem
# install rbenv ctags for enabling ctags with Ruby standard libraries
mkdir -p ~/.rbenv/plugins
git clone git://github.com/tpope/rbenv-ctags.git ~/.rbenv/plugins/rbenv-ctags
rbenv ctags

# installing oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# installing powerline fonts
git clone https://github.com/powerline/fonts.git
./fonts/install.sh
rm -rf fonts

# remove outdated version from the cellar
brew cleanup
