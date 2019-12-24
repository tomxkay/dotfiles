#!/bin/bash

# One liner to give you the full dir of the script despite calling location
#DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Get full dir of script, resolving symlink
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
	DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
	SOURCE="$(readlink "$SOURCE")"
	[[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"

DOTFILESDIR="$(dirname "$DIR")"
DOTFILES=(".zshrc" ".vimrc" ".tmux.conf" ".gitconfig" ".ctags" ".aliases" ".bash_aliases" ".inputrc")

# For each specified dotfile, create symbolic link
# -s Create a symbolic link
# -f If the target file already exists, then unlink it so that the link may occur
for dotfile in "${DOTFILES[@]}";do
	ln -sfv "${DOTFILESDIR}/${dotfile}" "${HOME}"
done
