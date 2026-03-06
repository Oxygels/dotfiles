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
end

export EDITOR=vim
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --exclude .git'

if not type -q busybox
    alias ip="ip -c"
    alias p="pgrep -li"
else
    alias p="ps aux | rg -v '(ps aux|rg -)' | rg -i"
end

alias lg="lazygit"
alias c="bat"
alias l="eza -l"
alias ll="eza -la"
alias d="du -haxd1 . | sort -h"
