if [ -n "$DESKTOP_SESSION" ]; then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi

export QT_QPA_PLATFORM=wayland

if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
    exec sway
fi