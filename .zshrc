zstyle ':completion:*' completer _complete _ignored _correct _approximate
zstyle :compinstall filename '/home/thedoctor/.zshrc'

autoload -Uz compinit
autoload -U colors
autoload -Uz promptinit
autoload -Uz vcs_info
compinit
colors
promptinit
setopt appendhistory
setopt correct
setopt prompt_subst
unsetopt beep
bindkey -e
precmd() { vcs_info }

export SPROMPT="Did you mean: $fg[green]%r$reset_color [nyae]? "

setopt HIST_IGNORE_DUPS
HISTFILE=~/.histfile
HISTSIZE=2000000
SAVEHIST=1000000

source ~/.profile
source ~/.dotfiles/.mytheme.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<




batdiff() {
    git diff --name-only --diff-filter=d | xargs bat --diff
}
