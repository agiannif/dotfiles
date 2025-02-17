# setup brew
eval "$(/opt/homebrew/bin/brew shellenv)"

# add machine report greeting
function fish_greeting
    # when interacting over ssh, was sometimes getting drawing issues if not waiting for a bit
    if string length --quiet $SSH_TTY
        sleep 0.33
    end
    fastfetch
end

# custom prompt
function fish_prompt
    # configure git status
    set -g __fish_git_prompt_showdirtystate yes

    # configure arrow to be green if last command return 0, red otherwise
    set -l last_status $status
    set -l arrow
    if test $last_status -ne 0
        set arrow (set_color red)' > '(set_color normal)
    else
        set arrow (set_color green)' > '(set_color normal)
    end

    string join '' -- '(' (prompt_hostname) ') ' (set_color yellow) (prompt_pwd --dir-length=4 --full-length-dirs 2) (set_color normal) (fish_vcs_prompt) $arrow
end

function fish_right_prompt
    string join '' -- (printf %.2f $(echo "$CMD_DURATION/1000" | bc -l)) s
end

# configure default editor
set -gx EDITOR hx

if status is-interactive
    # Commands to run in interactive sessions can go here
    abbr -a g git
    abbr -a k kubectl
    abbr -a tf terraform
    abbr -a v vagrant
    abbr -a lg lazygit
    abbr -a ld lazydocker
    abbr -a z zellij
end
