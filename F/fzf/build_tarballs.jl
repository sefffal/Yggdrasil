# Note that this script can accept some limited command-line arguments, run
# `julia build_tarballs.jl --help` to see a usage message.
using BinaryBuilder, Pkg

name = "fzf"
version = v"0.35.1"

# Collection of sources required to complete build
sources = [
    GitSource("https://github.com/junegunn/fzf.git", "b55f5554871e548c9c00a49df7a92f980c0191c2")
]

# Bash recipe for building across all platforms
script = raw"""
cd $WORKSPACE/srcdir/fzf/
mkdir -p ${bindir}
go build -o ${bindir}
"""

# These are the platforms we will build for by default, unless further
# platforms are passed in on the command line
platforms = supported_platforms()

# The products that we will ensure are always built
products = [
    ExecutableProduct("fzf", :fzf)
]

# Dependencies that must be installed before this package can be built
dependencies = Dependency[
]

# Build the tarballs, and possibly a `build.jl` as well.
build_tarballs(ARGS, name, version, sources, script, platforms, products, dependencies; compilers = [:go], julia_compat="1.6")