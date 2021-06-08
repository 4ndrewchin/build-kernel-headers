#!/bin/bash
# WARNING! Incomplete script. Just to get the gist of it

# Decompress the source
echo "Decompressing kernel tree"
tar -xzf source/linux-2.6.32.tar.gz -C source

# Copy the config to the linux source tree
cp config/atom_i386_defconfig source/linux-2.6.32/.config

# Prepare kernel source
pushd source/linux-2.6.32
echo "Preparing kernel source"
make prepare
make scripts

# Build kernel headers (see 4.4.111 /scripts/package/builddeb)
echo "Building kernel headers"
find . \( -name Makefile\* -o -name Kconfig\* -o -name \*.pl \) -exec cp --parent "{}" ../../headers \;
find arch/x86/include include scripts -type f -exec cp --parent "{}" ../../headers \;
find arch/x86 \( -name module.lds -o -name Kbuild.platforms -o -name Platform \) -exec cp --parent "{}" ../../headers \;
find $(find arch/x86 \( -name include -o -name scripts \) -type d) -type f -exec cp --parent "{}" ../../headers \;
find arch/x86/include Module.symvers include scripts -type f -exec cp --parent "{}" ../../headers \;

# Finish up
popd
cp config/atom_i386_defconfig headers/.config
echo "Done building kernel headers!"
