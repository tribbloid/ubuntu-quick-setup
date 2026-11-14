#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PACKAGES_DIR="$(dirname "$SCRIPT_DIR")"
SNAPSHOT_DIR="$PACKAGES_DIR/__snapshot"

xargs -a "$SNAPSHOT_DIR/dnf.csv" -r sudo dnf install -y

conda config --prepend channels conda-forge
conda env update -n root --file "$SNAPSHOT_DIR/conda-env.yml"
