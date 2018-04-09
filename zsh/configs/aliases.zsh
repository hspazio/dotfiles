alias ls='ls -GFh'
alias notes='vim ~/Box\ Sync/NOTES.txt'

alias be='bundle exec'

alias gws='cd $GOPATH/src/github.com/hspazio'

alias dk='docker-compose'
alias dkb='dk build'
alias dku='dk up -d'
alias dkd='dk down'
alias dkclean='docker image prune -a && docker volume rm $(docker volume ls -qf dangling=true)'

count_class_references() {
  find app lib -iname '*.rb' | 
  xargs grep -h '^[[:space:]]*class\|module\b' | 
  sed 's/^[[:space:]]*//' | 
  cut -d ' ' -f 2 | 
  while read class; do echo `grep -rl "\b$class\b" app lib --include="*.rb" | wc -l` $class; done | 
  sort -n | 
  uniq
}
alias references=count_class_references


