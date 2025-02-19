#!/bin/bash

# .vimrc git repo URL
VIMRC_URL="https://raw.githubusercontent.com/rishi-desai/my-vim/refs/heads/main/.vimrc"

# destination path
DEST_PATH="$HOME/.vimrc"

# download vimrc file
echo "Downloading .vimrc from git..."
curl -o $DEST_PATH $VIMRC_URL

# make directories
echo "Making directories for vim..."
mkdir -p ~/.vim ~/.vim/autoload ~/.vim/backup ~/.vim/colors ~/.vim/plugged

# enable plugins
echo "Enabling plugins for vim..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


# install plugins
echo "Installing plugins..."
vim +PlugInstall +qall

# move colortheme to correct folder
cp ~/.vim/plugged/onedark.vim/colors/onedark.vim ~/.vim/colors/
cp ~/.vim/plugged/onedark.vim/autoload/onedark.vim ~/.vim/autoload/

# apply changes
echo "Applying configs..."
vim +so % +qall

echo "Vim setup is complete :)"
