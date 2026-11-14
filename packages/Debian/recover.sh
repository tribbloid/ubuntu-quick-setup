#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PACKAGES_DIR="$(dirname "$SCRIPT_DIR")"
SNAPSHOT_DIR="$PACKAGES_DIR/__snapshot"

sudo apt-clone restore "$SNAPSHOT_DIR/latest.apt-clone.tar.gz"
#sudo apt-clone restore-new-distro "latest.apt-clone.tar.gz" "22.04 LTS"

conda config --prepend channels conda-forge
conda env update -n root --file "$SNAPSHOT_DIR/conda-env.yml"
