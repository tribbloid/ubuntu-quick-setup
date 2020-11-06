#!/usr/bin/env bash

echo "###############"
echo "#     apt     #"
echo "###############"

apt-clone show-diff latest.apt-clone.tar.gz

echo "###############"
echo "#    conda    #"
echo "###############"

conda compare -n root conda-env.yml

