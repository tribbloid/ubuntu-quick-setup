#!/usr/bin/env bash

echo ""
echo "###############"
echo "#     dconf   #"
echo "###############"
echo ""

diff <(dconf dump /) <(cat latest.dconf.conf)
