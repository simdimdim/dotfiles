export PATH="$HOME/.cargo/bin:$PATH"
export PYTHONSTARTUP=~/.pythonrc
export GPG_TTY=$(tty)
export _JAVA_AWT_WM_NONREPARENTING=1
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

alias re='sudo $(fc -ln -1)'
alias ls='ls --group-directories-first --color=auto -v'
alias ll='ls -lah --group-directories-first --color=auto -v'
alias ..='cd ..'
alias game='cd ~/Coding/CA02'
alias g3='cd ~/Coding/CA03'
alias g4='cd ~/Coding/CA04'
alias g5='cd ~/Coding/Docs/Rex'
alias kkf='killall /usr/lib/firefox/firefox'
alias kkc='killall code-oss'
alias sort='sort -h'
alias du='du -h'
alias journalctl='journalctl -e'
alias snano='sudo nano'
alias ss='sudo systemctl'
alias ssree='sudo systemctl reenable'
alias ssr='sudo systemctl restart'
alias sss='sudo systemctl status'
alias ssd='sudo systemctl daemon-reload'
alias ssz='sudo systemctl suspend'
alias ssre='sudo systemctl reboot'
alias sse='sudo systemctl edit --full'
alias ssa='systemd-analyze'
alias feh='feh -Z -. -x -R 1'
alias senso='watch -n 1 " sensors -A | grep \"temp\\|fan1\\|Core \" | grep -v coretemp "  '
alias space='watch -n 1 df -h'
alias ms.='f() { if [ -n "$1" ]; then a=($(du -sh $1/.[^.]* | sort -hr)); printf "%s\t%s\n" "${a[@]}"; fi }; f'
alias ms='f() { if [ -n "$1" ]; then a=($(du -sh "$@" | sort -hr)); printf "%s\t%s\n" "${a[@]}"; fi }; f'
alias wget='wget -c'
alias nv='yay -S --rebuild --answerclean=None nvidia-utils-beta nvidia-beta lib32-nvidia-utils-beta lib32-opencl-nvidia-beta opencl-nvidia-beta nvidia-settings-beta'
alias gg='git clone https://aur.archlinux.org/'

alias tmx='~/scripts/tmux_default.sh'

alias activate='conda activate tf'
alias deactivate='conda deactivate'
alias sysupdate='~/scripts/update'
alias nb='eval "$(conda shell.bash hook)";conda activate tf;jupyter notebook --notebook-dir="~/Coding" --no-browser --log-level WARN &;conda deactivate'
alias nbb='eval "$(conda shell.bash hook)";conda activate tf;jupyter notebook --notebook-dir="~/DL/Win/Coding/Notebooks" &'
# alias cargo='cargo -Zfeatures=itarget'
alias cargoall='cargo update && cargo build -j6; cargo build --release -j6'
alias cu='cargo upgrade && cargo update'
alias cb='cargo build -Zfeatures=itarget -j6'
alias ccc='cargo clean'

alias aliases='grep alias ~/.profile'

alias cfc='nano ~/.zshrc'
alias cfp='nano ~/.profile'
alias cft='nano ~/.dotfiles/.mytheme.zsh'
alias cf='source ~/.zshrc'
alias cfs='nano ~/.config/sxhkd/sxhkdrc'
alias cfb='nano ~/.config/bspwm/bspwmrc'
alias cfl='nano ~/.config/bspwm/launch.sh'
alias cfm='nano ~/.config/mpv/input.conf'
alias cfn='sudo nano /etc/nginx/nginx.conf'
alias cfd='sudo nano /etc/dhcpcd.conf'

export LIBTORCH=/home/thedoctor/libtorch export LD_LIBRARY_PATH=${LIBTORCH}/lib:$LD_LIBRARY_PATH export EDITOR=nano export 

