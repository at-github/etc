export TERM="screen-256color"
if [ `uname` != 'Darwin' ] && [ `uname` != 'MINGW32_NT-6.2' ]; then
    eval "`dircolors -b ~/.dircolors`"
fi

if [ -f ~/.bash_prompt ]; then
    . ~/.bash_prompt
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ `uname` == 'Darwin' ]; then
    if [ -f ~/.bash_aliases_mac ]; then
        . ~/.bash_aliases_mac
    fi
fi

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

#for mac os
if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
    . /usr/local/etc/bash_completion.d/git-completion.bash
fi

if [ -f /usr/local/etc/bash_completion.d/git-prompt.sh ]; then
    . /usr/local/etc/bash_completion.d/git-prompt.sh
fi

#for vddev cent os
if [ -f /etc/bash_completion.d/git ]; then
    . /etc/bash_completion.d/git
fi

#for mac os ?
if [ -f /usr/local/etc/bash_completion.d/tmux ]; then
    . /usr/local/etc/bash_completion.d/tmux
fi

#for debian
if [ -f /usr/share/doc/tmux/examples/bash_completion_tmux.sh ]; then
    . /usr/share/doc/tmux/examples/bash_completion_tmux.sh
fi

#for cent os
if [ -f /etc/bash_completion.d/bash_completion_tmux.sh ]; then
    . /etc/bash_completion.d/bash_completion_tmux.sh
fi

if [ -f ~/.bash_mancolor ]; then
    . ~/.bash_mancolor
fi

if [ -d ~/.local/bin ]; then
    PATH=$PATH:~/.local/bin
fi

#Note: for duplicate program concatenate the path at the end
if [ -d ~/.local/vim ]; then
    PATH=~/.local/vim/bin:$PATH
fi

if [ -d ~/.local/git ]; then
    PATH=~/.local/git/bin:$PATH
fi

if [ -f ~/.bash_aliases_local ]; then
    . ~/.bash_aliases_local
fi

if [ -f ~/.bashrc_local ]; then
    . ~/.bashrc_local
fi

umask 0002
