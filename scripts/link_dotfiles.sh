#!/bin/bash
dotfilesDir="$(dirname "$PWD")"
dotfiles=(".zshrc" ".vimrc" ".tmux.conf" ".gitconfig" ".ctags" ".aliases" ".bash_aliases" ".inputrc")

# For each specified dotfile, create symbolic link
# -s Create a symbolic link
# -f If the target file already exists, then unlink it so that the link may occur
for dotfile in "${dotfiles[@]}";do
	ln -sfv "${dotfilesDir}/${dotfile}" "${HOME}"
done
