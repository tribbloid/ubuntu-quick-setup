#!/usr/bin/env bash

source path-list.sh

for i in "${PATHS[@]}"; do
    echo " [PATH] $i"
    mkdir -p "__snapshot${i}"
    dconf dump $i > "__snapshot${i}dconf.txt"
done
