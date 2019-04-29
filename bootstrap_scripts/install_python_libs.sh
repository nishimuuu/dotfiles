#!/bin/bash

## pyenvの設定
pyenv install 2.7.11
pyenv install 3.6.6
pyenv global 3.6.6
pyenv rehash
sudo pip install numpy scipy scikit-learn gensim pandas matplotlib jupyter notebook jupyterlab
