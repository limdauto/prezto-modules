function dme {
    eval $(docker-machine env $1)
}

function dmip {
    docker-machine ip $1
}

function dr {
    while getopts ":i:" opt; do
        case $opt in
            i)
                if [[ $OPTARG -eq "grafana" ]]; then
                    docker run \
                       --detach \
                       --publish=80:80 \
                       --publish=81:81 \
                       --publish=8125:8125/udp \
                       --publish=8126:8126 \
                       --name grafana \
                       kamon/grafana_graphite
                elif [[ $OPTARG -eq "redis" ]]; then
                    docker run \
                        --detach \
                        --name redis \
                        -p 6379:6379
                        redis
                elif [[ $OPTARG -eq "mysql" ]]; then
                    docker run \
                        --detach \
                        --name mysql \
                        -e MYSQL_ROOT_PASSWORD=password \
                        mysql
                elif [[ $OPTARG -eq "postgres" ]]; then
                    docker run \
                        --detach \
                        --name postgres \
                        -e POSTGRES_PASSWORD=password \
                        postgres
                fi
                exit 0
                ;;
            :)
                echo "Option -$OPTARG requires an argument." >&2
                exit 1
                ;;
            \?)
                echo "Invalid option: -$OPTARG" >&2
                ;;
        esac
    done

    docker run $1
    exit 0
}

alias dps='docker ps'
alias drm='docker rm'

alias dm='docker-machine'
alias dmls='docker-machine ls'

alias dc='docker-compose'
alias dcu='docker-compose up'
