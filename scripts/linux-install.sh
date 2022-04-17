#!/bin/bash

# Linux Specific install
echo "Installing Linux specific software..."

is_app_installed() {
	command -v "$1" &>/dev/null
}

log_table() {
	items=("$@")
	for item in "${items[@]}"; do
		printf "%-8s\n" "${item}"
	done | column
}

print_spacing() {
	echo -e "\\n"
}

print_header() {
	GREEN='\033[0;32m'
	NC='\033[0m' # No Color

	print_spacing
	echo -e "${GREEN}:: $1 ::${NC}"
}

update_apt() {
	print_header "Preparing package manager"

	read -p "Do you want to update apt? (y/n) " should_update_apt

	if [ $should_update_apt = 'y' ]; then
		echo "Updating and upgrading apt..."
		sudo apt update && sudo apt upgrade
	fi
}

install_packages() {
	print_header "Preparing packages"

	packages=(
		bpython
		bpytop
		build-essential
		cmake
		ctags
		curl
		git
		fzf
		neofetch
		neovim
		nodejs
		python
		python3
		ripgrep
		tmux
		vim
		zsh
	)

	echo "Packages: "
	log_table "${packages[@]}"

	read -p "Do you want to install essential workflow packages listed above? (y/n) " should_install_packages

	if [ $should_install_packages = 'y' ]; then
		for package in "${packages[@]}"
		do
			echo "Installing $package..."
			sudo apt install $package -y
		done
	fi
}

remove_apt_vestigial_dependencies() {
	print_header "Clean bloat packages"

	read -p "Do you want to remove apt vestigial dependencies? (y/n) " should_remove_apt_vestigial_dependencies

	if [ $should_remove_apt_vestigial_dependencies = 'y' ]; then
		# Remove vestigial dependencies
		echo "Removing vestigial dependencies..."
		sudo apt autoremove
	fi
}

install_oh_my_zsh() {
	print_header "Oh-My-Zsh"

	read -p "Do you want to install oh-my-zsh? (y/n) " should_install_oh_my_zsh

	if [ $should_install_oh_my_zsh = 'y' ]; then
		echo "Installing oh-my-zsh..."
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	fi
}

make_zsh_default_shell() {
	print_header "Default zsh"

	read -p "Do you want to make zsh the default shell? (y/n) " should_make_zsh_default_shell

	if [ $should_make_zsh_default_shell = 'y' ]; then
		chsh -s $(which zsh)
	fi
}

install_vimplug_vim() {
	print_header "Vim plugin manager"

	read -p "Do you want to install vimplug for vim? (y/n) " should_install_vimplug_vim

	if [ $should_install_vimplug_vim = 'y' ]; then
		echo "Installing vimplug (vim)..."
		curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	fi
}

install_vimplug_neovim() {
	print_header "Neovim plugin manager"

	read -p "Do you want to install vimplug for neovim? (y/n) " should_install_vimplug_neovim

	if [ $should_install_vimplug_neovim = 'y' ]; then
		echo "Installing vimplug (neovim)..."
		curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	fi
}

install_tmux_plugin_manager() {
	print_header "Tmux plugin manager"

	read -p "Do you want to install tmux_plugin_manager? (y/n) " should_install_tmux_plugin_manager

	if [ $should_install_tmux_plugin_manager = 'y' ]; then
		echo "Installing tmux plugin manager"
		git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
	fi
}

# Script logic starts here
update_apt
install_packages
remove_apt_vestigial_dependencies

if is_app_installed zsh; then
	make_zsh_default_shell
	install_oh_my_zsh
fi

if is_app_installed vim; then
	install_vimplug_vim
fi

if is_app_installed nvim; then
	install_vimplug_neovim
fi

if is_app_installed tmux; then
	install_tmux_plugin_manager
fi

print_spacing
echo "Linux install script complete."
print_spacing

