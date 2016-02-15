function dme {
    eval $(docker-machine env $1)
}

function dmip {
    docker-machine ip $1
}

alias dps='docker ps'
alias dr='docker run'

alias dm='docker-machine'
alias dmls='docker-machine ls'

alias dc='docker-compose'
alias dcu='docker-compose up'
