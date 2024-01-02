#!/bin/bash

HOST_PRJ_PATH="$( cd "$( dirname ${BASH_SOURCE[0]} )/.." && pwd )"

STEP=0
function next() {
    echo "STEP ${STEP}: $1"
    ((STEP++))
}

next "Entering project folder: ${HOST_PRJ_PATH} ..."
cd "${HOST_PRJ_PATH}"

if [[ "$#" -eq 0 || "$1" -le "$STEP" ]]; then
    next "Install Dependencies ..."
    echo

    sudo apt-get update
    sudo apt-get install -y \
        git \
        wget \
        flex \
        bison \
        gperf \
        python3 \
        python3-pip \
        python3-venv \
        cmake \
        ninja-build \
        ccache \
        libffi-dev \
        libssl-dev \
        dfu-util \
        libusb-1.0-0 \
        unionfs-fuse \
        tree \
        linux-tools-generic \
        hwdata
    
    echo
else
    next "Skipping ..."
fi

if [[ "$#" -eq 0 || "$1" -le "$STEP" ]]; then
    next "Setup usb <-> ip deamon..."
    echo

    sudo apt-get update
    sudo apt-get install -y \
        linux-tools-generic \
        hwdata
    sudo update-alternatives \
        --install /usr/local/bin/usbip \
        usbip \
        /usr/lib/linux-tools/*-generic/usbip \
        20
    
    echo
else
    next "Skipping ..."
fi

if [[ "$#" -eq 0 || "$1" -le "$STEP" ]]; then
    next "Clone & install esp-idf toolchain to ~/esp-idf ..."
    echo

    git clone -b v5.1.2 --recursive https://github.com/espressif/esp-idf.git ~/esp-idf
    ~/esp-idf/install.sh

    echo
else
    next "Skipping ..."
fi

if [[ "$#" -eq 0 || "$1" -le "$STEP" ]]; then
    next "Clone micropython and its submodules ..."
    echo

    git clone https://github.com/micropython/micropython.git
    git -C micropython submodule update --init --recursive

    echo
else
    next "Skipping ..."
fi

if [[ "$#" -eq 0 || "$1" -le "$STEP" ]]; then
    next "Creating filessystem overlay ..."
    echo

    mkdir -p \
        micropython/ \
        src/ \
        output/ \
        merged/

    sudo unionfs-fuse \
        -o cow \
        -o allow_other \
        ./output=RW:./src=RO:./micropython=RO \
        ./merged

    echo
else
    next "Skipping ..."
fi
