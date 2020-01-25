#!/bin/sh

git pull

pip install --upgrade -r ./requirements/python/requirements.txt

python install_tools/install.py
