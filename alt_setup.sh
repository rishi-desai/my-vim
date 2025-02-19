#!/bin/bash

# destination path
DEST_PATH="$HOME/.vimrc"

# copy vimrc file
echo "Copying .vimrc to home directory..."
cp .vimrc $DEST_PATH

# make directories
echo "Making directories for vim..."
mkdir -p ~/.vim ~/.vim/autoload ~/.vim/backup ~/.vim/colors ~/.vim/plugged

# enable plugins
echo "Enabling plugins for vim..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
 https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install plugins
echo "Installing plugins..."
vim +'PlugInstall --sync' +qa

# move colortheme to correct folder
echo "Moving color theme files..."
cp ~/.vim/plugged/onedark.vim/colors/onedark.vim ~/.vim/colors/
cp ~/.vim/plugged/onedark.vim/autoload/onedark.vim ~/.vim/autoload/

# apply changes
echo "Applying configs..."
vim +so % +qall

echo "Vim setup is complete :)"
