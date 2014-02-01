#!/usr/bin/env bash

echo "start to install, make symbolic link config files"
declare -a files=('.bash_aliases' '.bash_mancolor' '.bash_profile' '.bash_prompt' '.bashrc' '.dircolors' '.gitconfig' '.gitignore' '.tmux.conf');

for file in "${files[@]}"
do
    ln -sfb "${PWD}"'/'"${file}" $HOME/"${file}"
done

source $HOME/.bashrc
