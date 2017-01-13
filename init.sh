mkdir $HOME/project $HOME/git $HOME/ss
sudo mkdir /opt/myscript/

cp .vim.zip /tmp/.vim.zip
cd $HOME
cp $HOME/dotfiles/.zshrc ./
cp $HOME/dotfiles/.vimrc ./
unzip $HOME/.vim.zip
mv /tmp/.vim.zip $HOME/.vim.zip
cd $HOME
ln -s $HOME/dotfiles/.vim .vim

cd $HOME/dotfiles/
sh brew.sh

