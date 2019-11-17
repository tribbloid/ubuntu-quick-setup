#!/usr/bin/env bash

git config --global credential.helper store
git pull --rebase --autostash

#git submodule init
git submodule foreach git pull --rebase --autostash
git submodule update --init --recursive --rebase

