if status is-interactive
    # This matching is necessary because the $TMUX variable isn't set when opening
    # a ssh connection through tmux
    # However the $TERM variable is kept
    if not string match -q 'tmux*' "$TERM"
        tmux
    end
end

export EDITOR=vim

if type -q eza
    alias l="eza -l"
    alias ll="eza -la"
else
    alias l="ls -l"
    alias ll="ls -al"
end

alias ip="ip -c"
alias lg="lazygit"
alias c="bat"
