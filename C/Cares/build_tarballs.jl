# Note that this script can accept some limited command-line arguments, run
# `julia build_tarballs.jl --help` to see a usage message.
using BinaryBuilder, Pkg

name = "Cares"
version = v"1.19.1"

# url = "https://c-ares.org/"
# description = "C library for asynchronous DNS requests (including name resolves)"

sources = [
    ArchiveSource("https://c-ares.org/download/c-ares-$(version).tar.gz",
                  "321700399b72ed0e037d0074c629e7741f6b2ec2dda92956abe3e9671d3e268e"),
]


script = raw"""
cd $WORKSPACE/srcdir/c-ares-*/

mkdir build && cd build
cmake .. \
    -DCMAKE_INSTALL_PREFIX=${prefix} \
    -DCMAKE_TOOLCHAIN_FILE=${CMAKE_TARGET_TOOLCHAIN} \
    -DCMAKE_BUILD_TYPE=Release

make -j${nproc}
make install

install_license ../LICENSE.md
"""

platforms = supported_platforms()

products = [
    ExecutableProduct("acountry", :acountry),
    ExecutableProduct("adig", :adig),
    ExecutableProduct("ahost", :ahost),
    LibraryProduct("libcares", :libcares),
]

dependencies = Dependency[
]

build_tarballs(ARGS, name, version, sources, script, platforms, products, dependencies;
               julia_compat="1.6")
