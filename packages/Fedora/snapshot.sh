#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PACKAGES_DIR="$(dirname "$SCRIPT_DIR")"
LOG_DIR="$PACKAGES_DIR/log"
SNAPSHOT_DIR="$PACKAGES_DIR/__snapshot"

mkdir -p "$LOG_DIR"
mkdir -p "$SNAPSHOT_DIR"

DATE=$(date --iso-8601=second)

rpm -qa --qf "%{NAME}-%{VERSION}-%{RELEASE} %{SUMMARY}\n" gpg-pubkey | sort > "$SNAPSHOT_DIR/rpm.keys.csv"

dnf repolist --enabled | tee "$LOG_DIR/dnf-report_$DATE.log" > "$SNAPSHOT_DIR/dnf-repos.txt"

dnf repoquery --userinstalled --qf "%{name}\n" | sort -u > "$SNAPSHOT_DIR/dnf.csv"

if command -v conda >/dev/null 2>&1; then
    conda env export -n root --from-history --no-builds > "$SNAPSHOT_DIR/conda-env.yml"
    conda env export -n root > "$SNAPSHOT_DIR/conda-env-full.yml"
fi

if command -v flatpak >/dev/null 2>&1; then
    flatpak list --app --columns=application > "$SNAPSHOT_DIR/flatpak.csv"
    flatpak list --app > "$SNAPSHOT_DIR/flatpak-full.csv"
fi

if command -v snap >/dev/null 2>&1; then
    snap list | awk 'NR>1 && $3 != "canonical" && $1 !~ /^(core|core[0-9]+|snapd|gnome-|gtk-|snap-store)/ {print $1}' > "$SNAPSHOT_DIR/snap.csv"
    snap list > "$SNAPSHOT_DIR/snap-full.csv"
fi

gnome-extensions list --user > "$SNAPSHOT_DIR/gnome-extensions.txt"
