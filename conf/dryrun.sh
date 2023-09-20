#!/usr/bin/env bash

echo ""
echo "###############"
echo "#     dconf   #"
echo "###############"
echo ""


source path-list.sh

for i in "${PATHS[@]}"; do
    echo " [PATH] $i"
    diff <(dconf dump $i) <(cat "__snapshot${i}dconf.txt")
done
