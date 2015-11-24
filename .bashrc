export TERM="screen-256color"

#Not working yet, don't ignore history
export HISTIGNORE="history:clear"

#Ignore cmd starting with space and duplicate command following
export HISTCONTROL="ignoreboth"

#Shorter path in prompt
PROMPT_DIRTRIM=3

#Ubuntu Debian ?
if [ -f /etc/bash.bashrc ]; then
    . /etc/bash.bashrc
fi

#Centos
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

if [ `uname` != 'Darwin' ] && [ `uname` != 'MINGW32_NT-6.2' ]; then
    eval "`dircolors -b ~/.dircolors`"
fi

if [ -f ~/.bash_prompt ]; then
    . ~/.bash_prompt
fi

if [ -f ~/.sh_aliases ]; then
    . ~/.sh_aliases
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ `uname` == 'Darwin' ]; then
    if [ -f ~/.sh_aliases_mac ]; then
        . ~/.sh_aliases_mac
    fi
fi

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

#for mac os
if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
    . /usr/local/etc/bash_completion.d/git-completion.bash
fi

if [[ $(which brew 2> /dev/null) != '' && -f $(brew --prefix)/etc/bash_completion ]]; then
    . $(brew --prefix)/etc/bash_completion
fi

if [ -f /usr/local/etc/bash_completion.d/git-prompt.sh ]; then
    . /usr/local/etc/bash_completion.d/git-prompt.sh
fi

#for vddev cent os
if [ -f /etc/bash_completion.d/git ]; then
    . /etc/bash_completion.d/git
fi

#for vddev cent os, with git 2.2
if [ -f /usr/share/git-core/contrib/completion/git-prompt.sh ]; then
    . /usr/share/git-core/contrib/completion/git-prompt.sh
fi

#Source this path so some program like ifconfig is autocompleted
if [ -d /sbin ]; then
    PATH=/sbin:$PATH
fi

if [ -f ~/.local/bin/git_ps1.sh ]; then
    . ~/.local/bin/git_ps1.sh
fi

if [ -f ~/.local/bin/wp-completion.bash ]; then
    . ~/.local/bin/wp-completion.bash
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


if [[ ! -d ~/.local/tmp ]]; then
    mkdir ~/.local/tmp
fi

display_for_tmux_path=~/.local/tmp/.display_for_tmux

if [[ "$TMUX" == '' ]]; then
    echo $DISPLAY > ${display_for_tmux_path}
elif [[ -f ${display_for_tmux_path} ]]; then
    export DISPLAY=$(\cat ${display_for_tmux_path})
fi

umask 0002
