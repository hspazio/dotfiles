# Fabio's dotfiles

## Installation

Run the following command from the **HOME** directory:

`git clone https://github.com/hspazio/dotfiles.git` 

`cd ~/dotfiles`

Run installation tasks

* `rake install:brew` uses [Homebrew Bundle] (https://github.com/Homebrew/homebrew-bundle) to install all the packages specified in the `Brewfile`
* `rake install:zsh` installs and configures `zsh`
* `rake install:vim` installs [Vundle](https://github.com/VundleVim/Vundle.vim) as package manager and other dependencies
* `rake install:ctags` sets up Vim and Ruby environment to work with ctags
* After that we need to link the dotfiles to the **HOME** directory. For this we will use:
`rake link`. This will command will also source `.zshrc` in order to apply the changes to the shell and will also install any new Vim packages.

* For a detailed list of tasks run `rake -T`
