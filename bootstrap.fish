#!/usr/bin/env fish

cd (dirname (status filename))
git pull origin main

function sync
    rsync --exclude ".git/" \
        --exclude ".DS_Store" \
        --exclude "bootstrap.fish" \
        --exclude "readme.adoc" \
        -avh --no-perms . ~
    source ~/.config/fish/config.fish
end

if test "$argv[1]" = "--force"; or test "$argv[1]" = "-f"
    sync
else
    read -P "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1 confirm
    echo
    if test "$confirm" = "Y"; or test "$confirm" = "y"
        sync
    end
end

functions -e sync
