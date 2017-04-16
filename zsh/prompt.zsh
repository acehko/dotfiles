setopt prompt_subst
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git   # Enable git
zstyle ':vcs_info:*' formats '%b' # Load git branch ($vcs_info_msg_0_)



# Left prompt
precmd () {

	# Run vcs info
	vcs_info

	# Colors
	color_ok='blue'
	color_error='red'
	color_branch='green'

	# Show exclamation mark if running with admin privileges
	PROMPT='%F{red}%(!. .)%f'

	# If in a git repository
	if [[ -n ${vcs_info_msg_0_} ]]; then

		# Git status dirty
		git_stauts=$(command git status --porcelain 2> /dev/null | tail -n1)
		if [[ -n $git_stauts ]]; then
			color_branch='yellow'
		fi

		PROMPT+="%F{$color_branch}$vcs_info_msg_0_%f "

	fi

	PROMPT+="%(?.%F{$color_ok}.%F{$color_error})❯%f "

}



# Right prompt

export KEYTIMEOUT=1 # Remove delay on ESC

# Vim modes
vim_ins_mode=""
vim_cmd_mode=" %F{blue}[CMD]%f"
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

RPROMPT='%F{242}%~%f${vim_mode}'
