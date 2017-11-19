alias ls='ls -GFh'
alias notes='vim ~/Box\ Sync/NOTES.txt'

alias be='bundle exec'

alias gws='cd $GOPATH/src/github.com/hspazio'

alias dk='docker-compose'
alias dkb='dk build'
alias dku='dk up -d'
alias dkd='dk down'
alias dkclean='docker image prune -a && docker volume rm $(docker volume ls -qf dangling=true)'
