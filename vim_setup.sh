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
cp ~/.vim/plugged/gruvbox/colors/gruvbox.vim ~/.vim/colors/
cp ~/.vim/plugged/gruvbox/autoload/gruvbox.vim ~/.vim/autoload/

# apply changes
echo "Applying configs..."
vim +so % +qall

echo "Vim setup is complete :)"

echo "Backing up .bashrc file..."
cp ~/.bashrc ~/.bashrc.bak

echo "Adding additional aliases to .bashrc..."
sed -i '131ialias wh="cd /home/osr/knapp/lager/bin/whmodel"' ~/.bashrc
sed -i '132ialias idl="cd /home/osr/knapp/lager/idl"' ~/.bashrc

echo "Applying .bashrc changes..."
source ~/.bashrc

echo ".bashrc changes complete :)"
