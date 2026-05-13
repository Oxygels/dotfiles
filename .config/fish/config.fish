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

    # Theme
    fish_config theme choose catppuccin-mocha --color-theme=dark

    # Busybox
    if not type -q busybox
        alias ip="ip -c"
        alias p="ps aux | rg -v '(ps aux|rg -)' | rg -i"
    end

    # External tools
    alias lg="lazygit"
    alias c="bat"
    alias l="eza -l"
    alias ll="eza -la"
    alias lf="lfcd"
    alias f="fastfetch"
    alias b="btop"

    # GNU tools
    alias d="du -haxd1 . | sort -h"
    alias e="$EDITOR"
    alias se="sudoedit"
    alias tarc="tar -czf"
    alias tarx="tar -xf"
    alias lsof="lsof +D" # Recursive lookup
    alias df="df -Th"
end
