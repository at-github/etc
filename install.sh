#!/usr/bin/env bash

echo "start to install, just copying config files"
declare -a files=(.bash_aliases .bash_profile .bash_prompt .bashrc .dircolors .gitconfig .gitignore .tmux.conf);

cp -i ${files[@]} $HOME

source $HOME/.bashrc
