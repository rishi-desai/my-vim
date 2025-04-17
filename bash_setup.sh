#!/bin/bash

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
add_alias "wh" "vi /home/osr/knapp/lager/bin/whmodel/$OSR_ID" 131
add_alias "idl" "cd /home/osr/knapp/lager/idl" 132
add_alias "sprint" "cd /kisoft/build/src/site/inst/$OSR_ID/_service" 133
add_alias "oci" "cd $OSR_HOME/../site/inst/$OSR_ID" 134
add_alias "rci" "read -p \\\"Are you sure you want to execute the script? (y/n) \\\" choice; if [[ \\$choice == \\\"y\\\" ]]; then ./\\\$OSR_HOME/../site/inst/\\\$OSR_ID/osr_create_instance_\\\$OSR_ID.sh; fi" 135
add_alias "ovi" "vi ~/.vimrc" 136
add_alias "obs" "vi ~/.bashrc" 137
add_alias "pm" "vi /kisoft/build/src/site/dat/port_map.txt" 138
add_alias "hm" "vi /kisoft/build/src/site/dat/host_map.txt" 139
add_alias "al" "auftlist" 140

line_to_add="$PS1='[\[\e[34m\]\u\[\e[0m\]@\h \[\e[32m\]\W\[\e[0m\] \[\e[31m\]$OSR_ID\[\e[0m\]]\$ '"
if ! grep -Fxq "$line_to_add" ~/.bashrc; then
    # If the line doesn't exist, append it to .bashrc
    echo "$line_to_add" >> ~/.bashrc
fi

echo "Applying .bashrc changes..."
source ~/.bashrc

echo ".bashrc changes complete :)"
