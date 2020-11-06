#!/usr/bin/env bash

DATE=$(date --iso-8601=second)

#apt clone
apt-clone clone latest > apt-report_$DATE.log

conda env export -n root --no-builds > conda-env.yml
