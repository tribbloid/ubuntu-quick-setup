#!/usr/bin/env bash

sudo apt-key add latest.keys # TODO: deprecated, will be removed after 2022

#sudo apt-clone restore latest.apt-clone.tar.gz
sudo apt-clone restore-new-distro latest.apt-clone.tar.gz

conda config --append channels conda-forge
conda env update -n root --file conda-env.yml
