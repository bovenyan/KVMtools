sudo add-apt-repository ppa:jonathonf/vim -y
sudo apt-get update

sudo apt-get install -y vim astyle git
sudo apt-get install -y build-essential cmake
sudo apt-get install -y python-dev python3-dev

git config --global push.default simple

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp .vimrc $HOME/

vim +PluginInstall +qall

pushd ~/.vim/bundle/YouCompleteMe 
./install.py --clang-completer
popd

echo "dev environment setup done"
