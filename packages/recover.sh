#!/usr/bin/env bash

#sudo apt-key add latest.keys # TODO: deprecated, will be removed after 2022

sudo apt-clone restore "latest.apt-clone.tar.gz"
#sudo apt-clone restore-new-distro "latest.apt-clone.tar.gz" "22.04 LTS"

conda config --prepend channels conda-forge
conda env update -n root --file snapshot/conda-env.yml
