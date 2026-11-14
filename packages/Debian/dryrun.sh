#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PACKAGES_DIR="$(dirname "$SCRIPT_DIR")"
SNAPSHOT_DIR="$PACKAGES_DIR/__snapshot"

echo ""
echo "###############"
echo "#   apt-key   #"
echo "###############"
echo ""

diff <(apt-key list | grep uid) <(cat "$SNAPSHOT_DIR/apt.keys.csv")

echo ""
echo "###############"
echo "#  apt-clone  #"
echo "###############"
echo ""

apt-clone show-diff "$SNAPSHOT_DIR/latest.apt-clone.tar.gz"

echo ""
echo "###############"
echo "#    conda    #"
echo "###############"
echo ""

conda compare -n root "$SNAPSHOT_DIR/conda-env.yml"
echo "  -------------"
diff <(conda env export -n root --from-history --no-builds) <(cat "$SNAPSHOT_DIR/conda-env.yml")