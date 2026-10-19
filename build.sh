#!/bin/bash
# Odin Game Engine - Build Script

set -e

BUILD_TYPE="${1:-debug}"
OUT_DIR="bin"
SRC_DIR="src"

# Create output directory
mkdir -p "$OUT_DIR"

# Determine build flags
case "$BUILD_TYPE" in
    release)
        ODIN_FLAGS="-o:speed -no-bounds-check"
        OUT_NAME="engine"
        ;;
    debug|*)
        ODIN_FLAGS="-debug"
        OUT_NAME="engine-d"
        ;;
esac

echo "Building Odin Game Engine ($BUILD_TYPE)..."
echo "Output: $OUT_DIR/$OUT_NAME"

# Build the engine
odin build "$SRC_DIR" \
    -out:"$OUT_DIR/$OUT_NAME" \
    $ODIN_FLAGS \
    -vet -strict-style

echo "Build complete: $OUT_DIR/$OUT_NAME"