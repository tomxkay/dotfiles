#!/bin/bash
dotfiles=(".vimrc" ".tmux.conf" ".aliases" ".bash_aliases")
dir="${HOME}/Documents/dotfiles"

# For each specified dotfile, create symbolic link
# -s Create a symbolic link
# -f If the target file already exists, then unlink it so that the link may occur
for dotfile in "${dotfiles[@]}";do
	ln -sfv "${dir}/${dotfile}" "${HOME}"
done
