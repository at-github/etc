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
