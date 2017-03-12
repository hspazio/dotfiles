require 'rake'

desc "Link dotfiles into $HOME"
task :link do
  link_file(from: 'tmux/tmux.conf', to: '.tmux.conf')
  link_file(from: 'ruby/rubocop.yml', to: 'rubocop.yml')
  link_file(from: 'vim/vimrc', to: '.vimrc')
  link_file(from: 'zsh/zshrc', to: '.zshrc')

  puts "sourcing zshrc"
  system %Q{ source #{ENV['HOME']}/.zshrc }
end

def link_file(from:, to:)
  local_file = "#{ENV['HOME']}/#{to}"
  system %Q{ rm #{local_file} }

  puts "linking #{from} -> #{local_file}"
  system %Q{ ln -s "$PWD/#{from}" "#{local_file}" }
end

