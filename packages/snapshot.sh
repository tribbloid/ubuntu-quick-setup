#!/usr/bin/env bash

mkdir -p log
mkdir -p snapshot

DATE=$(date --iso-8601=second)

apt-key exportall > latest.keys
apt-key list | grep "uid" > latest.keys.list

#apt clone
apt-clone clone latest > log/apt-report_$DATE.log

apt-mark showmanual > snapshot/apt.csv

mamba env export -n root --from-history --no-builds > snapshot/conda-env.yml

flatpak list --app > snapshot/flatpak.csv

snap list > snapshot/snap.csv