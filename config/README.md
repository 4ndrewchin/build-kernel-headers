To build the config, untar the linux source and enter the directory.

Build the x86 default config with `make ARCH=x86 defconfig`. Then manually set the processor type in the generated `.config` file:
```
CONFIG_MATOM=y
```
