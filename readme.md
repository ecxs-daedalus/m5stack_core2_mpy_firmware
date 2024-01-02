# M5Stack Core2 Micropython Firmware

This repository is for building the micropython port for the
[M5Stack Core2](https://shop.m5stack.com/products/m5stack-core2-esp32-iot-development-kit?variant=35960244109476)
board.

## Structure

The official micropython repository needs to be cloned inside the repository
(Not as a submodule, as the esp-idf toolchain the `.git` folder inside the
repository expects). All modifications and extentions are going to `src/`.
In the actual build process the folders `micropython/`, `src/`, `output/` are
overlayed with overlayfs-fuse so that all results are stored within
`output/`.

- `micropython/`: Micropython repository
                  (lower/read layer for container overlay)
- `src/`        : Modification to micropython sources
                  (middle/read layer for container overlay)
- `output/`     : Output directory for builds
                  (upper/write layer for container overlay)
- `merged/`     : Mount point for the overlayed directories
- `tools/`      : Scripts and toolchain configurations

## Requirements

To install and setup all necessary packets and repositories, the script:

```bash
./tools/setup.sh
```

can be used. Besides the directory overlay, the toolchain desciped in:

- [espressif: get-started](https://docs.espressif.com/projects/esp-idf/en/latest/esp32/get-started/linux-macos-setup.html)
- [micropython: esp32 port](https://github.com/micropython/micropython/tree/master/ports/esp32)

are installed. The Overlay can be recreated by providing the script with the
setup-step number:

```bash
./tools/setup.sh 5 # STEP 5: Setup Overlay
```

The usb-connection can be forwarded to wsl via
[connect-usb](https://learn.microsoft.com/en-us/windows/wsl/connect-usb) and
the commands (VID:PID = 1a86:55d4 for Core2):

```sh
usbipd list
usbipd bind --hardware-id 1a86:55d4
usbipd attach --wsl --hardware-id 1a86:55d4
```

## License

If not otherwise stated, this repository falls under the
[MIT](license.md)
license.
