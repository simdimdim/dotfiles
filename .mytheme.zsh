zstyle ':vcs_info:*' max-exports 3
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' get-revision true
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*+*:*' debug false
zstyle ':vcs_info:git*+set-message:*' hooks git-remotebranch git-st
zstyle ':vcs_info:git:*' formats '%m' '%6.6i' '%b'
zstyle ':vcs_info:git:*' stagedstr "↑"
zstyle ':vcs_info:git:*' unstagedstr "↓"

+vi-git-remotebranch() {
    local remote
    remote=${$(git rev-parse --verify ${hook_com[branch]}@{upstream} \
        --symbolic-full-name 2>/dev/null)/refs\/remotes\/}
    if [[ -n ${remote} ]] ; then
        hook_com[branch]="${hook_com[branch]} [${remote}]"
    fi
}
+vi-git-st() {
    local ahead behind
    local tracked stashed
    local -a gitstatus
<<<<<<< Updated upstream
    ahead=$(git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l)
    gitstatus+=( "%F{40}↑${ahead}%f" )
    behind=$(git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l)
    gitstatus+=( "%F{160}↓${behind}%f" )
=======
    ahead=$(git rev-list @{upstream}..HEAD 2>/dev/null | wc -l)
    (($ahead)) && gitstatus+=( "%F{40}↑$ahead%f" )
    behind=$(git rev-list HEAD..@{upstream} 2>/dev/null | wc -l)
    (($behind)) && gitstatus+=( "%F{160}↓$behind%f" )
>>>>>>> Stashed changes
    stashed=$(git stash list 2>/dev/null | wc -l)
    (( $stashed )) && gitstatus+=( "%{%F{244}%}#${stashed}%{%f%}" )
    tracked=$(git status --porcelain | grep '^??' | wc -l)
    (( $tracked )) && gitstatus+=( "%{%F{52}%}?${tracked}%{%f%}" )
    gitstatus+=( "" )
    hook_com[misc]+=${(j: :)gitstatus}

}
_update_vcs_info_msg() {
    local -a messages
    local prom
    local vcs_info_bold
    local cbranch
    local ccommit
    local -a stats
    local -a stash
    LANG=en_US.UTF-8 vcs_info
    vcs_info_bold=false
    case $vcs_info_msg_0_ in
        *'↑'*'↓'*)
            cbranch=yellow
            vcs_info_bold=true ;;
        *'↑'*)
            cbranch=green ;;
        *'↓'*)
            vcs_info_bold=true
            cbranch=red ;;
	*'#'*'?'*)
	    ccommit=25 ;;
	*'#'*)
	    ccommit=245 ;;
	*'?'*)
	    ccommit=52 ;;
    esac
    if [[ -z ${vcs_info_msg_0_} ]]; then
        prom="%T"
	PROMPT="%~# "
    else
	local temp
	temp=${vcs_info_msg_0_}
	for ((n=0;n<5;n++)); do
	    if [[ ${(j: :)stats} == *${temp%% *}* || ${(j: :)stash} == *${temp%% *}* ]] ; then
		break 
	    else
		if [[ $n -lt 2 ]]; then
		    i+=1
		    stats+=$(echo "${temp%% *}")
		else
		    stash+=$(echo "${temp%% *}")
		fi		
		temp="${temp#* }"
	    fi
	done
	prom="${stash} %F{$ccommit}${vcs_info_msg_1_}%f %F{$cbranch}${vcs_info_msg_2_}%f"
        if $vcs_info_bold; then
	    prom='%B'${prom}'%b'
        fi
        PROMPT="%~${(j::)stats}# "
    fi
    RPROMPT="$prom"
}

add-zsh-hook precmd _update_vcs_info_msg

bindkey '^[[1;5C' forward-word       # [Ctrl-RightArrow] - move forward one word
bindkey '^[[1;5D' backward-word      # [Ctrl-LeftArrow] - move backward one word
bindkey  "^[[H"   beginning-of-line  # Home key
bindkey  "^[[F"   end-of-line        # End key
bindkey  "^[[3~"  delete-char        # Delete key

bindkey  "^[[5~"  history-beginning-search-backward # PageUp, older history completion
bindkey  "^[[6~"  history-beginning-search-forward  # PageDown, later history completion

