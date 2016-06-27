#!/usr/bin/env bash
platform=$(uname);
declare -a files=(\
    '.zsh_aliases'\
    '.zsh_prompt'\
    '.shrc'\
    '.zshrc'\
    '.zsh'\
    '.sh_aliases'\
    '.sh_aliases_mac'\
    '.bash_mancolor'\
    '.bash_profile'\
    '.bash_prompt'\
    '.bashrc'\
    '.dircolors'\
    '.gitconfig'\
    '.gitignore'\
    '.git_template'\
    '.tmux.conf'\
    '.i3/config'\
    '.i3/pattern-1.png'\
    '.i3/pattern-2.png'\
    '.i3/pattern-3.png'\
    '.i3status.conf'\
    '.Xresources'\
    '.psqlrc'\
    '.config/konsolerc'\
);
folderLocal=${HOME}'/.local/bashAndTmux'

echo "_| Start to install, make symbolic link config files |_"

for file in "${files[@]}"
do
    # test if folder is require for the file
    if [[ ${file} == */* ]]; then
        #récupérer le nom du dossier
        IFS='/' read -a fileSplited <<< "$file"
        folder=${fileSplited[0]}'/'
        file=${fileSplited[1]}
        if [ ! -d ${HOME}/${folder} ]; then
            mkdir ${HOME}/${folder}
        fi
    else
        folder=''
    fi

    cd $folderLocal

    rm "${HOME}"/"${folder}""${file}"
    #Todo: necessary ?
    if [ ${platform} == 'Darwin' ]; then
        ln -shi "${PWD}"'/'"${folder}""${file}" "${HOME}"/"${folder}""${file}"
    else
        ln -si "${PWD}"'/'"${folder}""${file}" "${HOME}"/"${folder}""${file}"
    fi
done

printf "\n_| Source .bashrc |_\n\n"
source $HOME/.bashrc

git submodule init
git submodule update --depth 1

cd $OLDPWD
