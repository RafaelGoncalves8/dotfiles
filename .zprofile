setxkbmap -model thinkpad60 -layout br
~/scripts/caps_to_ctrl_and_esc.sh
xbindkeys -f ~/.xbindkeysrc

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    exec startx;
fi
