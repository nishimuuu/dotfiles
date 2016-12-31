cp .vim.zip /tmp/.vim.zip
cd ../
cp ./dotfiles/.zshrc ./
cp ./dotfiles/.vimrc ./
cd dotfiles
unzip .vim.zip
mv /tmp/.vim.zip .vim.zip
cd ../
ln -s ./dotfiles/.vim .vim
