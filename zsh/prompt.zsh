#!/usr/bin/env zsh

setopt prompt_subst
autoload -Uz vcs_info

zstyle ":vcs_info:*" enable git
zstyle ":vcs_info:*" formats "%b"

precmd () {
    vcs_info
    left_prompt
    right_prompt
}


# Draws the left prompt
left_prompt() {

    # Colors
    local color_blue="110"
    local color_green="107"
    local color_orange="215"
    local color_red="167"

    local color_ok=$color_blue
    local color_error=$color_red
    local color_branch=$color_green
    local color_host=$color_blue

    # Show exclamation mark if running with admin privileges
    PROMPT="%F{$color_red}%(!. .)%f"

    # If in a git repository
    if [[ -n ${vcs_info_msg_0_} ]]; then
        # Git status dirty
        git_status=$(command git status --porcelain 2> /dev/null | tail -n1)
        if [[ -n $git_status ]]; then
            color_branch=$color_orange
        fi

        PROMPT+="%F{$color_branch}$vcs_info_msg_0_%f "
    fi

    # If connected through ssh
    if [[ -n $SSH_CONNECTION ]]; then
        PROMPT+="@%F{$color_host}$(hostname)%f "
    fi

    PROMPT+="%(?.%F{$color_ok}.%F{$color_error})❯%f "

}

# Draws the right prompt
right_prompt() {

    # Colors
    local color_grey="242"
    local color_orange="215"

    local color_path=$color_grey
    local color_cmd=$color_orange

    # Vim modes
    vim_ins_mode=""
    vim_cmd_mode=" %F{$color_cmd}[CMD]%f"
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

    RPROMPT="%F{$color_path}%~%f$vim_mode"

}
