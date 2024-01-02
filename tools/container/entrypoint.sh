#!/bin/bash

source "${HOME}/esp-idf/install.sh"

unionfs-fuse \
    -o cow \
    "${HOME}/output=RW:${HOME}/src=RO:${HOME}/micropython=RO" \
    "${HOME}/merged"


cd "${HOME}/merged"

if [[ "$#" -gt 0 ]]; then
    bash -c "$@"
else
    bash
fi
