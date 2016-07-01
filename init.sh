cd ../
cp ./dotfiles/.zshrc ./
cp ./dotfiles/.vimrc ./
cd dotfiles
unzip .vim.zip
cd ../
ln -s ./dotfiles/.vim .vim
