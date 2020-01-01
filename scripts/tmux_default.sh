#!/usr/bin/env zsh

tmux start-server
tmux set-option -g remain-on-exit on
tmux has -t main
if [[ $? -eq 0 ]]; then
	tmux new -A -d -s main -c ~/Coding/CA01
else
	tmux new -A -d -s main -c ~/Coding/CA01
	tmux splitw -h -p 20 -t main:0
	tmux send-keys -t main:0 'senso' C-m
	tmux splitw -v -t main:0
	tmux send-keys -t main:0 'yay' C-m
	tmux neww -c ~
	tmux splitw -h -t main:1
	tmux selectw -t 0 
	tmux selectp -t 0
	tmux attach-session -d
fi
