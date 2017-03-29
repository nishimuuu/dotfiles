mkdir $HOME/project $HOME/git $HOME/ss
sudo mkdir -p /opt/myscript/

cp .vim.zip /tmp/.vim.zip
cd $HOME
ln $HOME/dotfiles/.vimrc .vimrc
ln $HOME/dotfiles/.zshrc .zshrc

unzip $HOME/.vim.zip
mv /tmp/.vim.zip $HOME/.vim.zip
cd $HOME
ln -s $HOME/dotfiles/.vim .vim

cd $HOME/dotfiles/
sh brew.sh

cp -R Xcode/ ~/Library/Developer/Xcode/
