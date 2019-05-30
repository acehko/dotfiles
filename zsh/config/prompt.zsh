#!/usr/bin/env zsh

export KEYTIMEOUT=1

setopt prompt_subst
autoload -Uz vcs_info

zstyle ":vcs_info:*" enable git
zstyle ":vcs_info:*" formats "%b"

# Vim modes
VIM_INS_MODE=""
VIM_CMD_MODE=" %F{$COLOR_TERM_YELLOW}[CMD]%f"
VIM_MODE="$VIM_INS_MODE"

# Update vim mode on change
function zle-keymap-select {
    VIM_MODE="${${KEYMAP/vicmd/${VIM_CMD_MODE}}/(main|viins)/${VIM_INS_MODE}}"
    draw_prompt
    zle reset-prompt
}
zle -N zle-keymap-select

# Reset vim mode
function zle-line-finish {
    VIM_MODE=$VIM_INS_MODE
}
zle -N zle-line-finish

# Reset vim mode on CTRL+C
function TRAPINT() {
    VIM_MODE=$VIM_INS_MODE
    draw_prompt
    return $(( 128 + $1 ))
}

precmd () {
    # Send alert to tmux if last command failed
    if [[ $? -ne 0 ]]; then
        echo -n -e "\a"
    fi

    vcs_info
    draw_prompt
}

# Draws the entire prompt
draw_prompt() {
    left_prompt
    right_prompt
}

# Draws the left prompt
left_prompt() {
    local COLOR_BRANCH=$COLOR_TERM_GREEN

    # Show exclamation mark if running with admin privileges
    PROMPT="%F{$COLOR_TERM_RED}%(!. .)%f"

    # If in a git repository
    if [[ -n ${vcs_info_msg_0_} ]]; then
        # Git status dirty
        git_status=$(command git status --porcelain 2> /dev/null | tail -n1)
        if [[ -n $git_status ]]; then COLOR_BRANCH=$COLOR_TERM_YELLOW fi

        PROMPT+="%F{$COLOR_BRANCH}$vcs_info_msg_0_%f "
    fi

    # If connected through ssh
    if [[ -n $SSH_CONNECTION ]]; then
        PROMPT+="@%F{$COLOR_TERM_BLUE}$(hostname)%f "
    fi

    PROMPT+="%(?.%F{$COLOR_TERM_BLUE}.%F{$COLOR_TERM_RED}%? )❯%f "

}

# Draws the right prompt
right_prompt() {
    RPROMPT="%F{$COLOR_TERM_BRIGHT_BLACK}%~%f"

    # Python virtualenv
    if [[ -n $VIRTUAL_ENV ]]; then
        RPROMPT+="%F{$COLOR_TERM_BRIGHT_BLACK} ( $(basename $VIRTUAL_ENV))%f"
    fi

    RPROMPT+="${VIM_MODE}"
}
