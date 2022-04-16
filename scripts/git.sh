#!/bin/bash

echo -e  "Setting up Git...\\n\\n"

defaultName=$( git config --global user.name )
defaultEmail=$( git config --global user.email )
defaultGithub=$( git config --global github.user )

read -rp "Name [$defaultName] " name
read -rp "Email [$defaultEmail] " email
read -rp "Github Username [$defaultGithub] " github

git config --global user.name "${name:-$defaultName}"
git config --global user.email "${email:-$defaultEmail}"
git config --global github.user "${github:-$defaultGithub}"

git config --global core.editor /usr/bin/vim
# git config pull.rebase false
git config pull.rebase true # rebase
# git config pull.ff only true

git config --global status.submoduleSummary true
git config --global diff.submodule log
git config --global fetch.recurseSubmodules on-demand
git config --global push.recurseSubmodules on-demand

git config --global alias.spull '__git_spull() { git pull "$@" && git submodule sync --recursive && git submodule update --init --recursive; }; __git_spull'
git config --global alias.spush 'push --recurse-submodules=on-demand'

if [[ "$( uname )" == "Darwin" ]]; then
	git config --global credential.helper "osxkeychain"
else
	read -rn 1 -p "Save user and password to an unencrypted file to avoid writing? [y/N] " save
	if [[ $save =~ ^([Yy])$ ]]; then
		git config --global credential.helper "store"
	else
		git config --global credential.helper "cache --timeout 3600"
	fi
fi
