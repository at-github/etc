if [ -f ~/.shrc ]; then
    . ~/.shrc
fi

# Enabled default prompt
autoload -U promptinit
promptinit

# Completion enabled
autoload -U compinit
compinit

#Enable auto comletion menu, need 2 tab
zstyle ':completion:*' menu select
#Enable colors from ls to completion
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
#Do not complete an exist word in line
zstyle ':completion:*:cp:*' ignore-line yes
zstyle ':completion:*:mv:*' ignore-line yes
zstyle ':completion:*:rm:*' ignore-line yes
#set autocompletion of command line switches for aliases
setopt completealiases

#Ignore duplicate entries in history
setopt HIST_IGNORE_DUPS

# Correct command
setopt correctall

# Use regex in command like ls
setopt extendedglob

# Aliases
if [ -f ~/.sh_aliases ]; then
    . ~/.sh_aliases
fi

if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi

if [[ `uname` == 'Darwin' ]]; then
    if [ -f ~/.sh_aliases_mac ]; then
        . ~/.sh_aliases_mac
    fi
fi

if [ -d ~/.local/bin ]; then
    PATH=$PATH:~/.local/bin
fi

if [ -f ~/.zsh_prompt ]; then
    . ~/.zsh_prompt
fi

if [ ! -d ~/.local/tmp ]; then
    mkdir ~/.local/tmp
fi

display_for_tmux_path=~/.local/tmp/.display_for_tmux

if [[ "$TMUX" == '' ]]; then
    echo $DISPLAY > ${display_for_tmux_path}
elif [ -f ${display_for_tmux_path} ] ; then
    export DISPLAY=$(\cat ${display_for_tmux_path})
fi

# Arrow search with pattern already typed
if [ -f "${TA_SOURCE_BIN_LIB}/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh" ]; then
    . "${TA_SOURCE_BIN_LIB}/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh"
fi

# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

if [ -f ~/.shrc.local ]; then
    . ~/.shrc.local
fi

umask 0002
