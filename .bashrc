#
# ~/.bashrc
#

# If not running interactively, don't do anything

if [ $(id -u) -eq 1000 ];
then # you are root, set red colour prompt
  PS1="\\w# "
else # normal
  PS1="\\u@\\H:\\w# "
fi

# function reload_gtk_theme() {
#   theme=$(gsettings get org.gnome.desktop.interface gtk-theme)
#   gsettings set org.gnome.desktop.interface gtk-theme ''
#   sleep 1
#   gsettings set org.gnome.desktop.interface gtk-theme $theme
# }
source ~/.profile
