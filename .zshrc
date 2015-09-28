# Define global, easy to find source not linking on home root
export TA_SOURCE_CONF="${HOME}/.local/bashAndTmux"

# Enabled default prompt
autoload -U promptinit
promptinit

# Completion enabled
autoload -U compinit
compinit

#Enable auto comletion menu, need 2 tab
zstyle ':completion:*' menu select
#set autocompletion of comman line switches for aliases
setopt completealiases

#Ignore duplicate entries in history
setopt HIST_IGNORE_DUPS

# Correct command
setopt correctall

# Use regex in command like ls
setopt extendedglob

# Aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi

# Todo: printing not found :s
# if [ `uname` == 'Darwin' ]; then
#     if [ -f ~/.bash_aliases_mac ]; then
#         . ~/.bash_aliases_mac
#     fi
# fi

if [ -f ~/.zsh_prompt ]; then
    . ~/.zsh_prompt
fi
