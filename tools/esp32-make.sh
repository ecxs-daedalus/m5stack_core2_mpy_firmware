#!/bin/bash

HOST_PRJ_DIR="$( cd "$( dirname ${BASH_SOURCE[0]} )/.." && pwd )"
CLIENT_HOME="/root"

mkdir -p \
    "${HOST_PRJ_DIR}/output/build" \
    "${HOST_PRJ_DIR}/output/workdir"

podman run \
    --volume "${HOST_PRJ_DIR}/micropython:${CLIENT_HOME}/micropython" \
    --volume "${HOST_PRJ_DIR}/src:${CLIENT_HOME}/src" \
    --volume "${HOST_PRJ_DIR}/output:${CLIENT_HOME}/output" \
    --privileged \
    esp32-make \
    "$@"
