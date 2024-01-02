#!/bin/bash

${HOME}/mount-setup.sh

cd ${HOME}/merged

make "$@"
