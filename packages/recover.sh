#!/usr/bin/env bash

sudo apt-clone restore __snapshot/latest.apt-clone.tar.gz
#sudo apt-clone restore-new-distro "latest.apt-clone.tar.gz" "22.04 LTS"

conda config --prepend channels conda-forge
conda env update -n root --file __snapshot/conda-env.yml
