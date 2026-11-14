#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PACKAGES_DIR="$(dirname "$SCRIPT_DIR")"
LOG_DIR="$PACKAGES_DIR/log"
SNAPSHOT_DIR="$PACKAGES_DIR/__snapshot"

mkdir -p "$LOG_DIR"
mkdir -p "$SNAPSHOT_DIR"

DATE=$(date --iso-8601=second)

apt-key list | grep "uid" > "$SNAPSHOT_DIR/apt.keys.csv"

#apt clone
apt-clone clone "$SNAPSHOT_DIR/latest" > "$LOG_DIR/apt-report_$DATE.log"

apt-mark showmanual > "$SNAPSHOT_DIR/apt.csv"

conda env export -n root --from-history --no-builds > "$SNAPSHOT_DIR/conda-env.yml"
conda env export -n root > "$SNAPSHOT_DIR/conda-env-full.yml"

flatpak list --app --columns=application > "$SNAPSHOT_DIR/flatpak.csv"
flatpak list --app > "$SNAPSHOT_DIR/flatpak-full.csv"

snap list | awk 'NR>1 && $3 != "canonical" && $1 !~ /^(core|core[0-9]+|snapd|gnome-|gtk-|snap-store)/ {print $1}' > "$SNAPSHOT_DIR/snap.csv"
snap list > "$SNAPSHOT_DIR/snap-full.csv"

gnome-extensions list --user > "$SNAPSHOT_DIR/gnome-extensions.txt"