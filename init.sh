
echo 
echo '+------------------+'
echo '| Create directory |'
echo '+------------------+'
echo

mkdir $HOME/project $HOME/git $HOME/ss
sudo mkdir /opt/myscript/
sudo cp -R $HOME/dotfiles/scripts/ /opt/myscript/


echo 
echo '+-------------------+'
echo '| Configure zsh/vim |'
echo '+-------------------+'
echo

cd $HOME
ln $HOME/dotfiles/.zshrc .zshrc
ln $HOME/dotfiles/.vimrc .vimrc
ln -s $HOME/dotfiles/.vim .vim

echo 
echo '+---------------------+'
echo '| install vim plugins |'
echo '+---------------------+'
echo
vim

echo 
echo '+------------------------+'
echo '| install cli/app in Mac |'
echo '+------------------------+'
echo
cd $HOME/dotfiles/
sh brew.sh

echo 
echo '+----------------------------------------+'
echo '| link github.com/nishimuuu/dotfiles.git |'
echo '+----------------------------------------+'
echo

cd $HOME/dotfiles
git init
git remote add https://github.com/nishimuuu/dotfiles.git
git reset hard --head

