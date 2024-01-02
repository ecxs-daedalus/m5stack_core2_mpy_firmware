# M5Stack Core2 Micropython Firmware

This repository is for building the micropython port for the
[M5Stack Core2](https://shop.m5stack.com/products/m5stack-core2-esp32-iot-development-kit?variant=35960244109476)
board.

## Structure

The official micropython repository is used as a submodule with all
modifications and extentions going to `src/`. The actual tooling is setup within
a container (See `tools/`). In the actual build process the folders
`micropython/`, `src/`, `output/` are overlayed within the container so that all results are stored within `output/build/`.

- `micropython/`: Micropython repository
                  (lower/read layer for container overlay)
- `src/`        : Modification to micropython sources
                  (middle/read layer for container overlay)
- `output/`
    - `build/`  : Output directory for builds
                  (upper/write layer for container overlay)
    - `workdir/`: Support folder for overlay (should be empty)
- `tools/`      : Scripts and toolchain configurations


## Requirements

For the container toolchain [podman](https://podman.io/docs/installation) needs to be installed.

Once podman is available, the required containers can be build with

```bash
./tools/container/build.sh
```

## Usage

Besides the directory overlery, the containers are setup with the toolchain desciped in:

- [espressif: get-started](https://docs.espressif.com/projects/esp-idf/en/latest/esp32/get-started/linux-macos-setup.html)
- [micropython: esp32 port](https://github.com/micropython/micropython/tree/master/ports/esp32)

To run make in the root directory within the container, use:

```bash
./tools/root-make.sh ARGUMENTS
```
and in the esp32 port directory, use:

```bash
./tools/esp32-make.sh ARGUMENTS
```

## License

If not otherwise stated, this repository falls under the
[MIT](license.md)
license.
