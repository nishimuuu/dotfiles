#!/bin/bash


## rbenvの設定
rbenv install 2.4.0
rbenv global 2.4.0
rbenv rehash
sudo gem install bundler cocoapods rubocop --no-ri --no-rdoc

