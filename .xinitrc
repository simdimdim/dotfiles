sxhkd &
eval $(ssh-agent)

[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.xprofile ] && . ~/.xprofile
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources


picom -b &
exec bspwm

xsetroot -cursor_name left_ptr
