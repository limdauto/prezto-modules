# Docker

Some convenient bindings for docker in a prezto prompt.

## Aliases

### Docker

* `dps`: list all running containers (`docker ps`)
* `ds`: search the hub for docker images (`docker search`)
* `dip <container-id>`: look up the ip of a given container id

#### Run

* `dr`: without argument, it is an alias for docker run
* `dr -i <name>`: use default trusted images with default options. Currently support:
    * grafana
    * redis
    * mysql
    * postgresql
    * influxdb with collectd support

### Docker Machine

* `dm`: short for `docker-machine`
* `dmls`: list all docker machines
* `dme`: eval environment variables of a machine on the host
* `dmip`: show the IP address of a given docker machine

### Docker Compose

* `dc`: short for `docker-compose`
* `dcu`: short for `docker-compose up`




