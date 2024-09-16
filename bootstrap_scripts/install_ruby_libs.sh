#!/bin/bash


## rbenvの設定
LATEST_VERSION=$(rbenv install -l | grep "\d.*.\d.*.\d$" | grep -v "[a-zA-Z]" | tail -1 | sed 's/ //g')
rbenv install $LATEST_VERSION
rbenv global $LATEST_VERSION
rbenv rehash
sudo gem install bundler cocoapods rubocop --no-ri --no-rdoc

