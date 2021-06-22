#!/usr/bin/env bash

DATE=$(date --iso-8601=second)

sudo apt-key exportall > latest.keys

#apt clone
apt-clone clone latest > apt-report_$DATE.log

conda env export -n root --from-history --no-builds > conda-env.yml
