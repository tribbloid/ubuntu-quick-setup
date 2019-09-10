#!/usr/bin/env bash

DATE=$(date --iso-8601=second)

#apt clone
sudo apt-clone clone latest > apt-report_$DATE.log

conda env export -n root > conda-env.txt
