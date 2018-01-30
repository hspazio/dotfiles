require 'rake'

desc "Link dotfiles into $HOME and run basic installation"
task :link do
  link_file(from: 'git/gitconfig', to: '.gitconfig')
  link_file(from: 'ruby/rubocop.yml', to: 'rubocop.yml')
  link_file(from: 'tmux/tmux.conf', to: '.tmux.conf')
  link_file(from: 'vim/vimrc', to: '.vimrc')
  link_file(from: 'vim/ctrlpignore', to: '.ctrlpignore')
  link_file(from: 'zsh/zshrc', to: '.zshrc')
  link_file(from: 'javascript/jshintrc', to: '.jshintrc')

  puts "sourcing zshrc"
  system %Q{ source #{ENV['HOME']}/.zshrc }

  puts "Installing Vim packages..."
  system %Q{ vim +PluginInstall +qa }
end

namespace :install do
  desc "Install vim"
  task :vim do
    puts "Installing Vundle"
    system %Q{ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim }

    puts "Installing powerline fonts for Vim..."
    system %Q{ git clone https://github.com/powerline/fonts.git }
    system %Q{ ./fonts/install.sh }
    system %Q{ rm -rf fonts }
  end

  desc "Install Brew packages"
  task :brew do
    puts "Installing Homebrew packages..."
    system %Q{ brew update }
    system %Q{ brew tap homebrew/bundle }
    system %Q{ brew bundle --file="Brewfile" }
  end

  desc "Setup Oh-my-zsh with syntax highlighting..."
  task :zsh do
    puts "Installing oh-my-zsh"
    system %Q{ sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" }
    puts  "Installing zsh-syntax-highlighting..."
    system %Q{ git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting }
  end

  desc 'Install Tmux paxkages'
  task :tmux do
    puts 'Installing tmux packages...'
    system %Q{ brew install tmux }
    system %Q{ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm }
  end

  desc "Install and setup ctags"
  task :ctags do
    puts "Setting up ctags..."

    # make ctags working with bundler and gems
    system %Q{ gem install gem-ctags }

    # index automatically any new gem 
    system %Q{ gem ctags }

    # install rbenv ctags for enabling ctags with Ruby standard libraries
    system %Q{ mkdir -p ~/.rbenv/plugins }
    unless File.exists?("#{ENV['HOME']}/.rbenv/plugins/rbenv-ctags")
      system %Q{ git clone git://github.com/tpope/rbenv-ctags.git ~/.rbenv/plugins/rbenv-ctags }
    end
    system %Q{ rbenv ctags }
  end

  desc "Install Ruby tools"
  task :ruby_tools do
    puts "Installing Ruby static analysis tools..."
    %w[flog rubocop].map do |gem| 
      system %Q{ gem install #{gem} }
    end
  end

  desc "Install Node.js"
  task :nodejs do
    system %Q{curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash}
    system %Q{source ~/.zshrc}
    system %Q{nvm install node}
  end
end

def link_file(from:, to:)
  local_file = "#{ENV['HOME']}/#{to}"
  system %Q{ rm #{local_file} }

  puts "linking #{from} -> #{local_file}"
  system %Q{ ln -s "$PWD/#{from}" "#{local_file}" }
end

