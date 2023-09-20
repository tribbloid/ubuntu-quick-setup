#!/usr/bin/env bash

source path-list.sh

for i in "${PATHS[@]}"; do
    echo " [PATH] $i"
    dconf load $i < "__snapshot${i}dconf.txt"
done
