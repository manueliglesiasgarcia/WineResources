#!/usr/bin/env bash
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
set -ex

# Install the Python packages that the build script depends upon
python3 -m pip install -r "$SCRIPT_DIR/requirements.txt"

# Run the build script, propagating any command-line arguments
python3 "$SCRIPT_DIR/build.py" "$@"
