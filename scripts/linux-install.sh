#!/bin/bash

# Linux Specific install
echo "Installing Linux specific software..."
echo "Updating and upgrading apt..."
sudo apt update && sudo apt upgrade

packages=(
	cowsay
	cmake
	figlet
	vim
	neovim
	nvm
	ctags
	zsh
)

for package in "${packages[@]}"
do
	echo "Installing $package..."
	sudo apt install $package -y
done

# Remove vestigial dependencies
echo "Removing vestigial dependencies..."
sudo apt autoremove

# oh-my-zsh
echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# vimplug vim
echo "Installing vimplug (vim)..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# vimplug neovim
echo "Installing vimplug (neovim)..."
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
