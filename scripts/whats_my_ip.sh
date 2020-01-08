#!/bin/bash

export DOCKER_HOST="${DOCKER_HOST:-}"

if [[ "${DOCKER_HOST}" != "" ]]; then
    echo "${DOCKER_HOST}"
else
    ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1' | head -n 1
fi

