#!/usr/bin/env bash
platform=$(uname);
declare -a files=('.zsh_aliases' '.zsh_prompt'  '.zshrc' '.bash_aliases' '.bash_aliases_mac' '.bash_mancolor' '.bash_profile' '.bash_prompt' '.bashrc' '.dircolors' '.gitconfig' '.gitignore' '.tmux.conf' '.i3/config' '.i3status.conf');
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

    # ln -b doesn't work on mac os
    if [ ${platform} == 'Darwin' ]; then
        ln -sf "${PWD}"'/'"${folder}""${file}" "${HOME}"/"${folder}""${file}"
    else
        ln -sfb "${PWD}"'/'"${folder}""${file}" "${HOME}"/"${folder}""${file}"
    fi
done

printf "\n_| Source .bashrc |_\n\n"
source $HOME/.bashrc

echo "_| Would you like to delete some backupped files in your home ? |_"
echo "_| (This script make some backupped files if it find file already exist) |_"
read -p "_| Yes or No (y|n) |_ ??? : " answer

if [[ "${answer}" == 'y' || "${answer}" == 'yes' ]]; then
    echo 'do it'
    rm -f ${HOME}/.*~
    rm -f ${HOME}/'.i3/'*~
else
    echo "Bye!"
fi

git submodule init
git submodule update

cd -
