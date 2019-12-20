#!/bin/bash

command_exists() {
	type "$1" > /dev/null 2>&1
}

unameOut="$(uname -s)"
case "${unameOut}" in
	Linux*)     machine=Linux;;
	Darwin*)    machine=Mac;;
	CYGWIN*)    machine=Cygwin;;
	MINGW*)     machine=MinGw;;
	*)          machine="UNKNOWN:${unameOut}"
esac
echo Machine type is ${machine}

echo "Linking dotfiles..."
source install/link_dotfiles.sh

echo "Linking bin executables..."
source install/link_executables.sh

# Linux specific install
if [ "$(machine)" == "Linux" ]; then
	echo -e "\n\nRunning on macOS"
	echo "Installing Linux specific software..."
	# cmake
	sudo apt install cmake -y
	# oh-my-zsh
	echo "Installing oh-my-zsh..."
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	# vimplug vim
	echo "Installing vimplug (vim)..."
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	# vimplug neovim
	echo "Installing vimplug (neovim)..."
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# echo "Setting up git meta..."
# source install/git.sh

# macOS  specific install
if [ "$(uname)" == "Darwin" ]; then
	echo -e "\n\nRunning on macOS"
	source install/brew.sh
fi

echo "install.sh script finished. Reload your terminal."
