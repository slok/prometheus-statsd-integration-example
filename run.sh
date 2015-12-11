#!/bin/bash

COMPOSE_VERSION=$(docker-compose --version | sed "s/docker-compose version://g" | sed "s/\.//g")
DOCKER_VERSION=$(docker --version | sed "s/Docker version \(.*\),.*/\1 /g" | sed "s/\.//g")

if (( "$DOCKER_VERSION" < "190" )); then
    echo "You need docker 1.9.0 at least"
    exit 1
fi

if (( "$COMPOSE_VERSION" < "150" )); then
    echo "You need docker 1.5.0 at least"
    exit 1
fi

docker-compose -p promstatsd --x-networking up
