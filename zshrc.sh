if [ -f ${TA_SOURCE_BIN}/lib/colors.sh ]; then
    source ${TA_SOURCE_BIN}/lib/colors.sh
fi
# To install source this file from your .zshrc file

# see documentation at http://linux.die.net/man/1/zshexpn
# A: finds the absolute path, even if this is symlinked
# h: equivalent to dirname
export __GIT_PROMPT_DIR=${0:A:h}

export GIT_PROMPT_EXECUTABLE=${GIT_PROMPT_USE_PYTHON:-"python"}

# Initialize colors.
autoload -U colors
colors

# Allow for functions in the prompt.
setopt PROMPT_SUBST

autoload -U add-zsh-hook

add-zsh-hook chpwd chpwd_update_git_vars
add-zsh-hook preexec preexec_update_git_vars
add-zsh-hook precmd precmd_update_git_vars

## Function definitions
function preexec_update_git_vars() {
    case "$2" in
        git*|hub*|gh*|stg*)
        __EXECUTED_GIT_COMMAND=1
        ;;
    esac
}

function precmd_update_git_vars() {
    if [ -n "$__EXECUTED_GIT_COMMAND" ] || [ ! -n "$ZSH_THEME_GIT_PROMPT_CACHE" ]; then
        update_current_git_vars
        unset __EXECUTED_GIT_COMMAND
    fi
}

function chpwd_update_git_vars() {
    update_current_git_vars
}

function update_current_git_vars() {
    unset __CURRENT_GIT_STATUS

    if [[ "$GIT_PROMPT_EXECUTABLE" == "python" ]]; then
        # TODO Move it in .local/bin
        local gitstatus="$__GIT_PROMPT_DIR/gitstatus.py"
        _GIT_STATUS=`python ${gitstatus} 2>/dev/null`
    fi

    __CURRENT_GIT_STATUS=("${(@s: :)_GIT_STATUS}")
    GIT_BRANCH=$__CURRENT_GIT_STATUS[1]
    GIT_AHEAD=$__CURRENT_GIT_STATUS[2]
    GIT_BEHIND=$__CURRENT_GIT_STATUS[3]
    GIT_STAGED=$__CURRENT_GIT_STATUS[4]
    GIT_CONFLICTS=$__CURRENT_GIT_STATUS[5]
    GIT_CHANGED=$__CURRENT_GIT_STATUS[6]
    GIT_UNTRACKED=$__CURRENT_GIT_STATUS[7]
    GIT_STASHED=$__CURRENT_GIT_STATUS[8]
}


git_super_status() {
    precmd_update_git_vars
    if [ -n "$__CURRENT_GIT_STATUS" ]; then
        STATUS="$ZSH_THEME_GIT_PROMPT_PREFIX$ZSH_THEME_GIT_PROMPT_BRANCH$GIT_BRANCH%{$RESET%}"
        if [ "$GIT_BEHIND" -ne "0" ]; then
            STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_SEPARATOR$ZSH_THEME_GIT_PROMPT_BEHIND$GIT_BEHIND%{$RESET%}"
        fi
        if [ "$GIT_AHEAD" -ne "0" ]; then
            STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_SEPARATOR$ZSH_THEME_GIT_PROMPT_AHEAD$GIT_AHEAD%{$RESET%}"
        fi
        STATUS="$STATUS:"
        if [ "$GIT_STASHED" -ne "0" ]; then
            STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_STASHED$GIT_STASHED%{$RESET%}$ZSH_THEME_GIT_PROMPT_SEPARATOR"
        fi
        if [ "$GIT_STAGED" -ne "0" ]; then
            STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_STAGED$GIT_STAGED%{$RESET%}$ZSH_THEME_GIT_PROMPT_SEPARATOR"
        fi
        if [ "$GIT_CONFLICTS" -ne "0" ]; then
            STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_CONFLICTS$GIT_CONFLICTS%{$RESET%}$ZSH_THEME_GIT_PROMPT_SEPARATOR"
        fi
        if [ "$GIT_CHANGED" -ne "0" ]; then
            STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_CHANGED$GIT_CHANGED%{$RESET%}$ZSH_THEME_GIT_PROMPT_SEPARATOR"
        fi
        if [ "$GIT_UNTRACKED" -ne "0" ]; then
            STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_UNTRACKED%{$RESET%}$ZSH_THEME_GIT_PROMPT_SEPARATOR"
        fi
        if [ "$GIT_CHANGED" -eq "0" ] && [ "$GIT_CONFLICTS" -eq "0" ] && [ "$GIT_STAGED" -eq "0" ] && [ "$GIT_UNTRACKED" -eq "0" ]; then
            STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_CLEAN"
        fi
        STATUS="$STATUS%{$RESET%}$ZSH_THEME_GIT_PROMPT_SUFFIX"
        echo "$STATUS"
    fi
}

# Default values for the appearance of the prompt. Configure at will.
#                             Declare how much space this symbol use
ZSH_THEME_GIT_PROMPT_PREFIX="%1{%} "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_SEPARATOR=" "
ZSH_THEME_GIT_PROMPT_BRANCH=""
ZSH_THEME_GIT_PROMPT_STAGED="%{$FGREEN%}%{✓ %G%}"
ZSH_THEME_GIT_PROMPT_STASHED="%{$FYELLOW%}%{⚑ %G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$FRED%}%{✖ %G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$FYELLOW%}%{⚡%G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{↓%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{↑%G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$FMAGENTA%}%{✖ %G%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FYELLOW%}%{ 1%G%}"
