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
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'

if type -q eza
    alias l="eza -l"
    alias ll="eza -la"
else
    alias l="ls -l"
    alias ll="ls -al"
end

if not type -q busybox
    alias ip="ip -c"
end

alias lg="lazygit"
alias c="bat"
