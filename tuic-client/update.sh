#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

# Get latest version
VER="$(basename "$(curl -fs -o/dev/null -w %{redirect_url} https://github.com/Itsusinn/tuic/releases/latest)")"

# Remove leading "v"
VER="${VER#v}"

# Update Makefile version
sed -i "s/^PKG_VERSION:=.*$/PKG_VERSION:=${VER}/" Makefile

echo "Write the following in the console to compile package:"
echo "make package/tuic-client/compile"
