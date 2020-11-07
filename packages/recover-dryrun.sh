#!/usr/bin/env bash

echo ""
echo "###############"
echo "#     apt     #"
echo "###############"
echo ""

apt-clone show-diff latest.apt-clone.tar.gz

echo ""
echo "###############"
echo "#    conda    #"
echo "###############"
echo ""

conda compare -n root conda-env.yml

