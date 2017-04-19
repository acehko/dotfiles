setopt prompt_subst
autoload -Uz vcs_info

zstyle ":vcs_info:*" enable git      # Enable git
zstyle ":vcs_info:*" formats "%b/%S" # Load git branch ($vcs_info_msg_0_)



precmd () {

	vcs_info
	left_prompt
	right_prompt

}


# Draws the left prompt
left_prompt() {


	# Colors
	color_ok="blue"
	color_error="red"
	color_branch="green"
	color_host="blue"


	# Show exclamation mark if running with admin privileges
	PROMPT="%F{red}%(!. .)%f"


	# If in a git repository
	if [[ -n ${vcs_info_msg_0_} ]]; then

		# Git status dirty
		git_status=$(command git status --porcelain 2> /dev/null | tail -n1)
		if [[ -n $git_status ]]; then
			color_branch="yellow"
		fi

		git_branch=$vcs_info_msg_0_
		if [[ $git_branch[-1] == "." ]]; then
			git_branch=$git_branch[0,-3]
		fi

		PROMPT+="%F{$color_branch}$git_branch%f "

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
	color_path="242"
	color_cmd="blue"

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


	RPROMPT='%F{$color_path}%~%f$vim_mode'


}
