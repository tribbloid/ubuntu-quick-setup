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

apt-clone show-diff __snapshot/latest.apt-clone.tar.gz

echo ""
echo "###############"
echo "#    conda    #"
echo "###############"
echo ""

conda compare -n root __snapshot/conda-env.yml
echo "  -------------"
diff <(conda env export -n root --from-history --no-builds) <(cat __snapshot/conda-env.yml)