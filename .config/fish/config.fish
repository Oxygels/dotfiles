if status is-interactive
    # Commands to run in interactive sessions can go here
    if not set -q TMUX
        tmux
    end
end


alias l="eza -l"
alias ll="eza -la"
alias ip="ip -c"
alias lg="lazygit"
