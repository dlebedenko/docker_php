#!/bin/bash

[[ ! -f .env ]] && {
    cp env.example .env
    echo "first init, change .env for youself !"
    exit 1
}
source .env

cd images/php-${PHP_VERSION}
docker build -t docker-workspace_php-${PHP_VERSION} .

[[ $? -eq 0 ]] && docker push docker-workspace_php-${PHP_VERSION}
