#!/bin/sh
# some stuff stolen from Gabe Berke-Williams (https://github.com/gabebw/dotfiles)
# you should check it out!
set -e

is_osx() {
  [ "$(uname -s)" = Darwin ]
}

is_linux() {
  [ "$(uname -s)" = Linux ]
}

if is_osx; then
  echo "Installing Homebrew packages..."
  brew update
  brew tap homebrew/bundle
  brew bundle --file="Brewfile"
fi

echo "Setting up ctags..."
# make ctags working with bundler and gems
gem install gem-ctags 
# index automatically any new gem 
gem ctags
# install rbenv ctags for enabling ctags with Ruby standard libraries
mkdir -p ~/.rbenv/plugins
git clone git://github.com/tpope/rbenv-ctags.git ~/.rbenv/plugins/rbenv-ctags
rbenv ctags

echo "Installing zsh-syntax-highlighting..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "Installing powerline fonts for Vim..."
git clone https://github.com/powerline/fonts.git
./fonts/install.sh
rm -rf fonts

echo "Installing Ruby static analysis tools..."
gem install flog
gem install rubocop

echo "Installing Vim packages..."
vim +PluginInstall +qa
