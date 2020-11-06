#!/usr/bin/env bash

sudo apt-clone restore latest.apt-clone.tar.gz

conda env update -n root --file conda-env.yml

