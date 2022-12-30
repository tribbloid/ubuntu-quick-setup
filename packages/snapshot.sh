#!/usr/bin/env bash

mkdir -p log

DATE=$(date --iso-8601=second)

apt-key exportall > latest.keys
apt-key list | grep "uid" > latest.keys.list

#apt clone
apt-clone clone latest > log/apt-report_$DATE.log

conda env export -n root --from-history --no-builds > conda-env.yml

flatpak list --app > flatpak.txt

snap list > snap.txt