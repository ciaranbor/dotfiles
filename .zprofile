if [[ "$OSTYPE" == "darwin"* ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if [ -n "$DESKTOP_SESSION" ]; then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi

export QT_QPA_PLATFORM=wayland

if [ -z $DISPLAY ]; then
    case $(tty) in
        /dev/tty1)
            exec Hyprland
            ;;
    esac
fi
