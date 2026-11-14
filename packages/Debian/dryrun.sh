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

echo ""
echo "###############"
echo "#   flatpak   #"
echo "###############"
echo ""

if command -v flatpak >/dev/null 2>&1 && [ -f "$SNAPSHOT_DIR/flatpak.csv" ]; then
    diff <(flatpak list --app --columns=application) <(cat "$SNAPSHOT_DIR/flatpak.csv")
fi

echo ""
echo "###############"
echo "#    snap     #"
echo "###############"
echo ""

if command -v snap >/dev/null 2>&1 && [ -f "$SNAPSHOT_DIR/snap.csv" ]; then
    diff <(snap list | awk 'NR>1 && $3 != "canonical" && $1 !~ /^(core|core[0-9]+|snapd|gnome-|gtk-|snap-store)/ {print $1}') <(cat "$SNAPSHOT_DIR/snap.csv")
fi

echo ""
echo "####################"
echo "# gnome-extensions #"
echo "####################"
echo ""

if command -v gnome-extensions >/dev/null 2>&1 && [ -f "$SNAPSHOT_DIR/gnome-extensions.txt" ]; then
    diff <(gnome-extensions list --user) <(cat "$SNAPSHOT_DIR/gnome-extensions.txt")
fi