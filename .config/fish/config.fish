function fish_greeting
    neofetch
end

# configure nvim to be the default
alias vim=nvim
set -gx EDITOR nvim

if status is-interactive
    abbr -a k kubectl
    abbr -a tf terraform
    # Commands to run in interactive sessions can go here
end
