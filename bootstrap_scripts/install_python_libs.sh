#!/bin/bash

## pyenvの設定
LATEST_VERSION=$(pyenv install -l | grep "\s\s\d.*.\d.*.\d$" | grep -v "[a-zA-Z]" | tail -1 | sed 's/ //g')
pyenv install $LATEST_VERSION
pyenv global $LATEST_VERSION
pyenv rehash
sudo pip install numpy scipy scikit-learn gensim pandas matplotlib jupyter notebook jupyterlab autopep8 sqlparse
