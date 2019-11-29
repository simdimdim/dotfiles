export PATH="$HOME/.cargo/bin:$PATH"
export PYTHONSTARTUP=~/.pythonrc

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    eval "$(<"$XDG_RUNTIME_DIR/ssh-agent.env")"
fi

alias re='sudo $(fc -ln -1)'
alias ls='ls --group-directories-first --color=auto -v'
alias ll='ls -lah --group-directories-first --color=auto -v'
alias ..='cd ..'
alias snano='sudo nano'
alias ss='sudo systemctl'
alias ssree='sudo systemctl reenable'
alias ssr='sudo systemctl restart'
alias sss='sudo systemctl status'
alias ssz='sudo systemctl suspend'
alias ssre='sudo systemctl reboot'
alias feh='feh -Z -. -x -R 1'
alias senso='watch -n 1 " sensors -A | grep \"temp\\|fan1\\|Core \" | grep -v coretemp "  '
alias space='watch -n 1 df -h'
alias ms.='f() { if [ -n "$1" ]; then a=($(du -sh $1/.[^.]* | sort -hr)); printf "%s\t%s\n" "${a[@]}"; fi }; f'
alias ms='f() { if [ -n "$1" ]; then a=($(du -sh "$@" | sort -hr)); printf "%s\t%s\n" "${a[@]}"; fi }; f'
alias wget='wget -c'

alias activate='conda activate tf'
alias deactivate='conda deactivate'
alias sysupdate='~/scripts/update'
alias nb='eval "$(conda shell.bash hook)";conda activate tf;jupyter notebook --notebook-dir="~/Coding" --no-browser --log-level WARN &;conda deactivate'
alias nbb='eval "$(conda shell.bash hook)";conda activate tf;jupyter notebook --notebook-dir="~/DL/Win/Coding/Notebooks" &'
alias cargoall='cargo update && cargo build -j6; cargo build --release -j6'

alias zshconfig='nano ~/.zshrc'
alias zshconfigtheme='nano ~/.dotfiles/.mytheme.zsh'
alias sxconfig='nano ~/.config/sxhkd/sxhkdrc'
alias bspconfig='nano ~/.config/bspwm/bspwmrc'

export _JAVA_AWT_WM_NONREPARENTING=1
export GPG_TTY=$(tty)
