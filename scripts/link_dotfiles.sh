#!/bin/bash

# One liner to give you the full dir of the script despite calling location
function getExecScriptPwd {
	# Get full dir of script, resolving symlink
	SOURCE="${BASH_SOURCE[0]}"

	while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
		DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
		SOURCE="$(readlink "$SOURCE")"
		[[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
	done

	DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"

	local EXECSCRIPTPWD="$(dirname "$DIR")"

	echo $EXECSCRIPTPWD
}

function initDestDir {
	mkdir -p "$XDG_CONFIG_HOME/zsh"
	mkdir -p "$XDG_CONFIG_HOME/nvim"
	mkdir -p "$XDG_CONFIG_HOME/vim"
	mkdir -p "$XDG_CONFIG_HOME/tmux"
	mkdir -p "$XDG_CONFIG_HOME/ctags"
	mkdir -p "$XDG_CONFIG_HOME/git"
}

# Get dotfile destination
function getSymLinkDest {
	case $1 in
		".zshenv")
			echo "$HOME/$1"
			;;
		".zshrc")
			echo "$XDG_CONFIG_HOME/zsh/.zshrc"
			;;
		"init.vim")
			echo "$XDG_CONFIG_HOME/nvim/init.vim"
			;;
		".vimrc")
			echo "$XDG_CONFIG_HOME/vim/vimrc"
			;;
		".tmux.conf")
			echo "$XDG_CONFIG_HOME/tmux/tmux.conf"
			;;
		".ctags")
			echo "$XDG_CONFIG_HOME/ctags/.ctags"
			;;
		".gitconfig")
			echo "$XDG_CONFIG_HOME/git/config"
			;;
		*)
			echo "$HOME/$1"
			;;
	esac
}

DOTFILESDIR=$(getExecScriptPwd)

DOTFILES=(
	".zshenv"
	".zshrc"
	"init.vim"
	".vimrc"
	".tmux.conf"
	".gitconfig"
	".ctags"
)

# Initialize symlink destination directories
initDestDir

# For each specified dotfile, create symbolic link
# -s Create a symbolic link
# -f If the target file already exists, then unlink it so that the link may occur

for dotfile in "${DOTFILES[@]}";do
	DEST=$(getSymLinkDest $dotfile)
	ln -sfv "${DOTFILESDIR}/${dotfile}" "${DEST}"
done

