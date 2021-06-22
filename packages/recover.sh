#!/usr/bin/env bash

sudo apt-key add latest.keys # TODO: deprecated, will be removed after 2022

sudo apt-clone restore latest.apt-clone.tar.gz

conda env update -n root --file conda-env.yml

