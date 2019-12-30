[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.xprofile ] && . ~/.xprofile
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

picom -b &
sxhkd &
eval $(ssh-agent)

exec bspwm

xsetroot -cursor_name left_ptr
