#!/usr/bin/env zsh

setopt prompt_subst
autoload -Uz vcs_info

zstyle ":vcs_info:*" enable git
zstyle ":vcs_info:*" formats "%b"

precmd () {
    # Send alert to tmux if last command failed
    if [[ $? -ne 0 ]]; then
        echo -n -e "\a"
    fi

    vcs_info
    left_prompt
    right_prompt
}


# Draws the left prompt
left_prompt() {

    local COLOR_BRANCH=$COLOR_GREEN

    # Show exclamation mark if running with admin privileges
    PROMPT="%F{$COLOR_RED}%(!. .)%f"

    # If in a git repository
    if [[ -n ${vcs_info_msg_0_} ]]; then
        # Git status dirty
        git_status=$(command git status --porcelain 2> /dev/null | tail -n1)
        if [[ -n $git_status ]]; then
            COLOR_BRANCH=$COLOR_ORANGE
        fi

        PROMPT+="%F{$COLOR_BRANCH}$vcs_info_msg_0_%f "
    fi

    # If connected through ssh
    if [[ -n $SSH_CONNECTION ]]; then
        PROMPT+="@%F{$COLOR_BLUE}$(hostname)%f "
    fi

    PROMPT+="%(?.%F{$COLOR_BLUE}.%F{$COLOR_RED}%? )❯%f "

}

# Draws the right prompt
right_prompt() {
    # Vim modes
    vim_ins_mode=""
    vim_cmd_mode=" %F{$COLOR_ORANGE}[CMD]%f"
    vim_mode=$vim_ins_mode

    # Update vim mode on change
    function zle-keymap-select {
        vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
        zle reset-prompt
    }
    zle -N zle-keymap-select

    # Reset vim mode
    function zle-line-finish {
        vim_mode=$vim_ins_mode
    }
    zle -N zle-line-finish

    # Reset vim mode on CTRL+C
    function TRAPINT() {
        vim_mode=$vim_ins_mode
        return $(( 128 + $1 ))
    }

    RPROMPT="%F{$COLOR_GREY}%~%f$vim_mode"

}
