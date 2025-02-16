#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin main;

function sync() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude "bootstrap.sh" \
		--exclude "readme.adoc" \
		-avh --no-perms . ~;
	source ~/.config/fish/config.fish;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	sync;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		sync;
	fi;
fi;
unset sync;
