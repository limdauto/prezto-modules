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
                if [[ $OPTARG == "grafana" ]]; then
                    docker run \
                       --detach \
                       --publish=80:80 \
                       --publish=81:81 \
                       --publish=8125:8125/udp \
                       --publish=8126:8126 \
                       --name grafana \
                       kamon/grafana_graphite;
                elif [[ $OPTARG == "redis" ]]; then
                    docker run \
                        --detach \
                        --name redis \
                        -p 6379:6379 \
                        redis;
                elif [[ $OPTARG == "mysql" ]]; then
                    docker run \
                        --detach \
                        --name mysql \
                        -e MYSQL_ROOT_PASSWORD=password \
                        mysql;
                elif [[ $OPTARG == "postgres" ]]; then
                    docker run \
                        --detach \
                        --name postgres \
                        -e POSTGRES_PASSWORD=password \
                        postgres;
                elif [[ $OPTARG == "influxdb-collectd" ]]; then
                    docker run \
                        --detach \
                        -p 8083:8083 \
                        -p 8086:8086 \
                        -p 25826:25826/udp \
                        -e ADMIN_USER="root" \
                        -e INFLUXDB_INIT_PWD="collectd" \
                        -e PRE_CREATE_DB=collectd -e COLLECTD_DB="collectd" \
                        -e COLLECTD_BINDING=':25826' \
                        tutum/influxdb;
                fi
                return 0
                ;;
            :)
                echo "Option -$OPTARG requires an argument." >&2
                exit 1
                ;;
            \?)
                echo "Invalid option: -$OPTARG" >&2
                exit 1
                ;;
        esac
    done

    docker run $1
}

function dip {
    docker inspect --format '{{ .NetworkSettings.IPAddress }}' $1
}

alias dps='docker ps'
alias drm='docker rm'

alias dm='docker-machine'
alias dmls='docker-machine ls'

alias dc='docker-compose'
alias dcu='docker-compose up'
