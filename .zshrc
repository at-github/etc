# Completion enabled
autoload -U compinit
compinit

# Enabled default prompt
autoload -U promptinit
promptinit

# Customize completion kill
zmodload zsh/complist
setopt extendedglob
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=36=31"

# Correct command
setopt correctall

# Use regex in command like ls
setopt extendedglob

# Aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Todo: printing not found :s
# if [ `uname` == 'Darwin' ]; then
#     if [ -f ~/.bash_aliases_mac ]; then
#         . ~/.bash_aliases_mac
#     fi
# fi
