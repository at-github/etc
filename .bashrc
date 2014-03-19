export TERM="screen-256color"

if [ -f ~/.bash_prompt ]; then
    . ~/.bash_prompt
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

for file in /etc/bash_completion.d/* ; do
    source "$file"
done

if [ -f ~/.bash_mancolor ]; then
    . ~/.bash_mancolor
fi

if [ -d ~/.local/bin ]; then
    PATH=$PATH:~/.local/bin
fi

umask 0002
