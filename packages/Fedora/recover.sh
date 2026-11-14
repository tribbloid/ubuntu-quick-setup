#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PACKAGES_DIR="$(dirname "$SCRIPT_DIR")"
SNAPSHOT_DIR="$PACKAGES_DIR/__snapshot"

if [ -s "$SNAPSHOT_DIR/dnf.csv" ]; then
    xargs -a "$SNAPSHOT_DIR/dnf.csv" -r sudo dnf install -y --skip-unavailable --skip-broken
fi

if command -v conda >/dev/null 2>&1 && [ -s "$SNAPSHOT_DIR/conda-env.yml" ]; then
    conda config --prepend channels conda-forge
    conda env update -n root --file "$SNAPSHOT_DIR/conda-env.yml"
fi

if command -v flatpak >/dev/null 2>&1 && [ -s "$SNAPSHOT_DIR/flatpak.csv" ]; then
    flatpak remote-add --system --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
    while IFS= read -r app; do
        [ -n "$app" ] && flatpak install --system -y --noninteractive --or-update flathub "$app"
    done < "$SNAPSHOT_DIR/flatpak.csv"
fi

if command -v snap >/dev/null 2>&1 && [ -s "$SNAPSHOT_DIR/snap.csv" ]; then
    while IFS= read -r pkg; do
        [ -n "$pkg" ] && sudo snap install "$pkg"
    done < "$SNAPSHOT_DIR/snap.csv"
fi

if [ -s "$SNAPSHOT_DIR/gnome-extensions.txt" ]; then
    if command -v gext >/dev/null 2>&1; then
        xargs -a "$SNAPSHOT_DIR/gnome-extensions.txt" -r gext install
    else
        echo "Skipping gnome-extensions restore: install 'gnome-extensions-cli' (gext) or use Extension Manager to install:"
        cat "$SNAPSHOT_DIR/gnome-extensions.txt"
    fi
fi
