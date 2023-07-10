#!/usr/bin/env bash

echo ""
echo "###############"
echo "#   apt-key   #"
echo "###############"
echo ""

diff <(apt-key list | grep uid) <(cat latest.keys.list)

echo ""
echo "###############"
echo "#  apt-clone  #"
echo "###############"
echo ""

apt-clone show-diff latest.apt-clone.tar.gz

echo ""
echo "###############"
echo "#    conda    #"
echo "###############"
echo ""

conda compare -n root snapshot/conda-env.yml

diff <(mamba env export -n root --from-history --no-builds) <(cat snapshot/conda-env.yml)