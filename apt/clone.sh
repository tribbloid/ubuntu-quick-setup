#!/usr/bin/env bash

DATE=$(date --iso-8601=second)

sudo apt-clone clone latest > report_$DATE.txt