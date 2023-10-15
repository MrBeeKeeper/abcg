#!/bin/bash
set -eu pipefail

BUILD_TYPE=${1:-Release}
CMAKE_EXTRA_ARGS=${2:-""}

# Reset build directory
rm -rf build
mkdir -p build && cd build

# Configure
emcmake cmake -DGRAPHICS_API=OpenGL -DCMAKE_BUILD_TYPE="$BUILD_TYPE" $CMAKE_EXTRA_ARGS ..

# Build
NUM_PROCESSORS="$(nproc)"

cmake --build . --config "$BUILD_TYPE" -- -j "$NUM_PROCESSORS"
