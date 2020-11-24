#!/bin/bash

# Linux Specific install
echo "Installing Linux specific software..."

update_apt() {
	read -p "Do you want to update apt? (y/n) " should_update_apt

	if [ $should_update_apt = 'y' ]
	then
		echo "Updating and upgrading apt..."
		sudo apt update && sudo apt upgrade
	fi
}

install_packages() {
	read -p "Do you want to install packages? (y/n) " should_install_packages

	if [ $should_install_packages = 'y' ]
	then
		packages=(
			cowsay
			cmake
			ctags
			figlet
			neovim
			nvm
			ripgrep
			vim
			zsh
		)

		for package in "${packages[@]}"
		do
			echo "Installing $package..."
			sudo apt install $package -y
		done
	fi
}

remove_apt_vestigial_dependencies() {
	read -p "Do you want to remove apt vestigial dependencies? (y/n) " should_remove_apt_vestigial_dependencies

	if [ $should_remove_apt_vestigial_dependencies = 'y' ]
	then
		# Remove vestigial dependencies
		echo "Removing vestigial dependencies..."
		sudo apt autoremove
	fi
}

install_oh_my_zsh() {
	read -p "Do you want to install oh-my-zsh? (y/n) " should_install_oh_my_zsh

	if [ $should_install_oh_my_zsh = 'y' ]
	then
		echo "Installing oh-my-zsh..."
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	fi
}

install_vimplug_vim() {
	read -p "Do you want to vimplug for vim? (y/n) " should_install_vimplug_vim

	if [ $should_install_vimplug_vim = 'y' ]
	then
		echo "Installing vimplug (vim)..."
		curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	fi
}

install_vimplug_neovim() {
	read -p "Do you want to vimplug for neovim? (y/n) " should_install_vimplug_neovim

	if [ $should_install_vimplug_neovim = 'y' ]
	then
		echo "Installing vimplug (neovim)..."
		curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	fi
}

update_apt
install_packages
remove_apt_vestigial_dependencies
install_oh_my_zsh
install_vimplug_vim
install_vimplug_neovim

echo -e "Linux install script complete.\n"

