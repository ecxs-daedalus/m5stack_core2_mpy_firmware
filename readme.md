# M5Stack Core2 Micropython Firmware

This repository is for building the micropython port for the
[M5Stack Core2](https://shop.m5stack.com/products/m5stack-core2-esp32-iot-development-kit?variant=35960244109476)
board.

## Structure

The official micropython repository needs to be cloned inside the repository
(Not as a sub-module, as the esp-idf tool-chain the `.git` folder inside the
repository expects). All modifications and extensions are going to `src/`.
In the actual build process the folders `micropython/`, `src/`, `output/` are
overlayed with overlayfs-fuse so that all results are stored within
`output/`.

- `micropython/`: Micropython repository
                  (Lower/Read layer for overlay)
- `src/`        : Modification to micropython sources
                  (Middle/Read layer for overlay)
- `output/`     : Output directory for builds
                  (Upper/Write layer for overlay)
- `merged/`     : Working directory
                  (Mount point for the overlayed directories)
- `tools/`      : Scripts and tool-chain configurations

## Requirements

To install and setup all necessary packets and repositories, run:

```bash
./tools/setup.sh
```

Besides the directory overlay, the tool-chain is installed as described in:

- [espressif: get-started](https://docs.espressif.com/projects/esp-idf/en/latest/esp32/get-started/linux-macos-setup.html)
- [micropython: esp32 port](https://github.com/micropython/micropython/tree/master/ports/esp32)


The USB-connection can be forwarded to wsl via
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
