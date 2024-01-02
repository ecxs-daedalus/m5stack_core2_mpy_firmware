#!/bin/bash

HOST_PRJ_PATH="$( cd "$( dirname ${BASH_SOURCE[0]} )/../.." && pwd )"

podman build \
    --file "${HOST_PRJ_PATH}/tools/container/containerfile" \
    --tag mpy-build-env
