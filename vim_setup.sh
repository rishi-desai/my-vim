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

# Check if .bashrc exists, if not, create it
if [ ! -f ~/.bashrc ]; then
    touch ~/.bashrc
    echo "# .bashrc file created" >> ~/.bashrc
fi

echo "Backing up .bashrc file..."
cp ~/.bashrc ~/.bashrc.bak

# Function to add alias if it doesn't exist
add_alias() {
    local alias_name="$1"
    local alias_command="$2"
    local alias_line="$3"
    if ! grep -q "$alias_name=" ~/.bashrc; then
        sed -i "${alias_line}ialias ${alias_name}=\"${alias_command}\"" ~/.bashrc
    fi
}

echo "Adding additional aliases to .bashrc..."
add_alias "wh" "cd /home/osr/knapp/lager/bin/whmodel" 131
add_alias "idl" "cd /home/osr/knapp/lager/idl" 132
add_alias "sprint" "cd /kisoft/build/src/lager/inst/_service" 133
add_alias "oci" "cd $OSR_HOME/../site/inst/$OSR_ID" 134
add_alias "rci" 'read -p '\''Are you sure you want to execute the script? (y/n) '\'' choice; if [[ $choice == "y" ]]; then ./$OSR_HOME/../site/inst/$OSR_ID/osr_create_instance_$OSR_ID.sh; fi' 135
add_alias "ovi" "vi ~/.vimrc" 136
add_alias "obs" "vi ~/.bashrc" 137

echo "Applying .bashrc changes..."
source ~/.bashrc

echo ".bashrc changes complete :)"
