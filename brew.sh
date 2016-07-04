if brew > /dev/null 2>&1; then
 echo "brew exists"
else
 ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" 
fi

brew tap samueljohn/python
brew tap homebrew/science
brew tap phinze/cask
brew tap phinze/homebrew-cask


brew install git
brew install nkf
brew install tree
brew install wget
brew install pyenv
brew install node
brew install npm
brew install rbenv
brew install ruby-build
brew install mas


brew cask install appcleaner
brew cask install bettertouchtool
brew cask install coteditor
brew cask install cyberduck
brew cask install eclipse-ide
brew cask install eclipse-platform
brew cask install google-chrome
brew cask install google-japanese-ime
brew cask install iterm2
brew cask install omnigraffle
brew cask install r
brew cask install rstudio
brew cask install skype
brew cask install sourcetree
brew cask install sequel-pro
brew cask install virtualbox
brew cask install vagrant
brew cask install intellij-idea
brew cask install alfred
brew cask install atom

mas install 539883307
mas install 414855915
mas install 417375580
mas install 409183694
mas install 460883588
mas install 918858936
mas install 585829637
mas install 425955336
mas install 425424353
mas install 411246225
mas install 1040002810
mas install 896624060
mas install 443987910
mas install 557168941
mas install 409203825
mas install 403388562
mas install 409201541
mas install 867299399
mas install 448925439
mas install 715768417
mas install 886106985
mas install 803453959
mas install 714196447
mas install 449589707
mas install 402398561

# Desktopにファイルを表示しない
defaults write com.apple.finder CreateDesktop -bool false
defaults write com.apple.finder NewWindowTarget -string "PfLo"

# Finderで新規ウィンドウを開くときはホームに設定
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}"

# 拡張子変更で怒られない
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaultps write com.apple.finder FXDefaultSearchScope -string "SCcf"
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"
defaults write com.apple.finder ShowRecentTags -bool false
defaults write com.apple.finder SidebarDevicesSectionDisclosedState -bool true
defaults write com.apple.finder SidebarPlacesSectionDisclosedState -bool true


defaults write com.apple.finderSidebarSharedSectionDisclosedState -bool true

## 拡張子を全部表示
defaults write -g AppleShowAllExtensions -bool true

## ネットワーク上のディスクに.DS_Storeを作らない
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

## キーリピートを爆速にする
defaults write -g KeyRepeat -int 2
defaults write -g InitialKeyRepeat -int 15

# Quicklookに表示されるテキストをコピペ可能にする
defaults write com.apple.finder QLEnableTextSelection -bool true


# スクショの設定
## 保存をjpgにする
defaults write com.apple.screencapture type jpg

## スクショに影をつけない
defaults write com.apple.screencapture "disable-shadow" -bool yes

## スクショの名前をssからはじめる
defaults write com.apple.screencapture name ss

## 保存先を$HOME/ssにする
defaults write com.apple.screencapture location ~/ss/

killall Dock
killall SystemUIServer
killall Finder


## Atomの設定
apm install atom-material-ui
apm install markdown-preview
apm install autocomplete-paths
apm install color-picker
apm install highlight-selected
apm install minimap
apm install minimap-git-diff
apm install pigments
apm install git-time-machine
apm install autocomplete-sass
apm install merge-conflicts
apm install vim-mode-plus
apm install file-icons
apm install terminal-plus
apm install ex-mode


## npmの設定
npm install -g eslint
npm install -g webpack
npm install -g gulp


## gemの設定
sudo gem install bundler --no-ri --no-rdoc


## pipの設定
pyenv install 2.7.11
pyenv global 2.7.11
pyenv rehash

sudo pip install numpy scipy scikit-learn gensim pandas matplotlib jupyter notebook
