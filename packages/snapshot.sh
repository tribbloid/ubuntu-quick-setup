#!/usr/bin/env bash

mkdir -p log
mkdir -p __snapshot

DATE=$(date --iso-8601=second)

apt-key exportall > latest.keys
apt-key list | grep "uid" > latest.keys.list

#apt clone
apt-clone clone latest > log/apt-report_$DATE.log

apt-mark showmanual > __snapshot/apt.csv

conda env export -n root --from-history --no-builds > __snapshot/conda-env.yml

flatpak list --app > __snapshot/flatpak.csv

snap list > __snapshot/snap.csv