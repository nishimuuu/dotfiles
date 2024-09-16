#!/bin/bash

echo 'Install Homebrew'

if brew > /dev/null 2>&1; then
 echo "brew exists"
else
 ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" 
fi

echo 'Finish install Homebrew'
