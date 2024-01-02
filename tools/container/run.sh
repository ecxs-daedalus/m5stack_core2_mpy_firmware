#!/bin/bash

HOST_PRJ_PATH="$( cd "$( dirname ${BASH_SOURCE[0]} )/../.." && pwd )"
CLIENT_HOME="/root"

mkdir -p \
    "${HOME}/micropython" \
    "${HOME}/src" \
    "${HOME}/output"

podman run \
    --volume "${HOST_PRJ_PATH}/micropython:${CLIENT_HOME}/micropython" \
    --volume "${HOST_PRJ_PATH}/src:${CLIENT_HOME}/src" \
    --volume "${HOST_PRJ_PATH}/output:${CLIENT_HOME}/output" \
    --privileged \
    --interactive \
    --tty \
    mpy-build-env \
    "$@"
