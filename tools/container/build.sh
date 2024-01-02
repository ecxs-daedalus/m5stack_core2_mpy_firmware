#!/bin/bash

HOST_PRJ_DIR="$( cd "$( dirname ${BASH_SOURCE[0]} )/../.." && pwd )"

mkdir -p \
    "${HOST_PRJ_DIR}/output/build" \
    "${HOST_PRJ_DIR}/output/workdir"

podman build \
    --file "${HOST_PRJ_DIR}/tools/container/containerfile" \
    --target root-make \
    --tag root-make

podman build \
    --file "${HOST_PRJ_DIR}/tools/container/containerfile" \
    --target esp32-make \
    --tag esp32-make
