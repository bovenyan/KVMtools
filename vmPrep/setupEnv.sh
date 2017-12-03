sudo add-apt-repository ppa:jonathonf/vim -y
sudo apt-get update

sudo apt-get install -y vim astyle
sudo apt-get install -y build-essential cmake
sudo apt-get install -y python-dev python3-dev

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp .vimrc $HOME/

vim +PluginInstall +qall

pushd ~/.vim/bundle/YouCompleteMe 
./install.py --clang-completer
popd

echo "dev environment setup done"
