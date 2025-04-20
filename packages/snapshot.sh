#!/usr/bin/env bash

mkdir -p log
mkdir -p __snapshot

DATE=$(date --iso-8601=second)

#apt-key exportall > __snapshot/latest.keys
apt-key list | grep "uid" > __snapshot/latest.keys.list

#apt clone
apt-clone clone __snapshot/latest > log/apt-report_$DATE.log

apt-mark showmanual > __snapshot/apt.csv

conda env export -n root --from-history --no-builds > __snapshot/conda-env.yml
conda env export -n root > __snapshot/conda-env-full.yml

flatpak list --app --columns=application > __snapshot/flatpak.csv
flatpak list --app > __snapshot/flatpak-full.csv

snap list | awk 'NR>1 && $3 != "canonical" && $1 !~ /^(core|core[0-9]+|snapd|gnome-|gtk-|snap-store)/ {print $1}' > __snapshot/snap.csv
snap list > __snapshot/snap-full.csv