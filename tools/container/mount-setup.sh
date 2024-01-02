#!/bin/bash

mount \
    -o "lowerdir=${HOME}/micropython:${HOME}/src,upperdir=${HOME}/output/build,workdir=${HOME}/output/workdir" \
    -t overlay overlay "${HOME}/merged"
