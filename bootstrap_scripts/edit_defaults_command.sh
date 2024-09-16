#!/bin/bash 

set -x
echo 'Modify Mac settings using defaults command'

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
