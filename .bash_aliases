alias ub='python ~/.local/bin/pullRepositories.py; clear'
alias rb='source ~/.bashrc; printf "bashrc reloaded!"'
alias eb='vim -p ~/.bashrc ~/.bash_aliases ~/.bash_prompt'

alias c='cd'
#Move to the near root git folder
alias cdg='cd $(findRepo.sh)'
alias cbash='c ~/.local/bashAndTmux'
alias cbin='c ~/.local/bin'

alias ls='ls --color=auto'
alias ll='ls -lFh --group-directories-first'
alias l='ll'
alias lla='ll -a'
alias la='ls -a'

alias grep='grep -n --color=auto'
alias g='grep'
alias gg='git grep -n'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias f='find'

#Process shouldn't have a terminal
#By user
alias ps='ps ux'

alias cp='cp -i'
alias mv='mv -i'
alias m='mv'
alias rm='rm -i'
alias r='rm'

alias cat='cat -n'
alias hi='highlight -O ansi'

alias df='df -H'
alias du='du -ch'

alias todo='g -is todo *'

alias v='vim -p'
alias nv='nvim -p'
alias vi="v"
alias vie="v +:Explore"
alias ve="vie"
alias vin="v +:NERDTreeToggle"
alias vn="vin"
alias ev='v -p ~/.vimrc ~/.vim/.vimrc.bepo'
alias evn='v -p ~/.nvimrc ~/.nvim/.vimrc.bepo'
alias cv='c ~/.vim/'
alias cnv='c ~/.nvim/'

alias gitdiff="watch --color -n 2 git diff --color=always"
alias gd="gitdiff"
alias tgd="tmux split-window -h; tmux send-keys gd ENTER"

alias gitst="watch --color -n 2 git st"
alias gt="gitst"
alias tgitst="tmux split-window -h; tmux send-keys gitst ENTER"

alias ei3='v -p ~/.i3status.conf ~/.i3/config'
