# Variables
export EDITOR=nvim
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --exclude .git'

if status is-interactive
    # This matching is necessary because the $TMUX variable isn't set when opening
    # a ssh connection through tmux
    # However the $TERM variable is kept
    # The dolphin check is added to avoid unclosed tmux everywhere (causing issues with removable storage)
    if not string match -q 'tmux*' "$TERM"
        and type -q fastfetch
        and not string match -q '*dolphin*' (fastfetch | grep Terminal)
        tmux
    end

    # Busybox
    if not type -q busybox
        alias ip="ip -c"
        alias p="pgrep -li"
    else
        alias p="ps aux | rg -v '(ps aux|rg -)' | rg -i"
    end

    # Tools
    alias lg="lazygit"
    alias c="bat"
    alias l="eza -l"
    alias ll="eza -la"

    # Utilities
    alias d="du -haxd1 . | sort -h"
    alias e="$EDITOR"
    alias se="sudoedit"
    alias tarc="tar -czf"
    alias tarx="tar -xf"
end
