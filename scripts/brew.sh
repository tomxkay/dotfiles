#!/bin/bash

is_app_installed() {
	type "$1" &>/dev/null
}

# If Homebrew is not installed, install Homebrew
if test ! "$( command -v brew )"; then
	echo "Homebrew not installed. Installing homebrew..."
	ruby -e "$( crl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install )"
fi

echo -e "\\n\\nInstalling homebrew packages..."
echo "================================"

# Install the command line developer toolsc
xcode-select --install

install_packages() {
	# Specify brew packages to be installed
	cmlApps=(
		archey #screenfetch
		cask #macOS GUI app installer
		cmake
		ctags
		deno
		fzf
		gcc #need to compile cask
		git
		htop #resource monitor
		irssi #irc
		links #terminal browser
		macvim
		mas
		ncdu #disk util
		neovim
		nmap #network scanner
		node
		nvm
		peco #interactive filtering
		python
		ripgrep
		tig #git
		tmux
		vim
		weechat
		wget
		zsh
	)

	guiApps=(
		docker
		visual-studio-code
		macvim
		google-chrome
		dropbox
	)

	packages_length=${#cmlApps[@]}
	current_pos=1
	packages_labels=""

	for package in "${cmlApps[@]}"
	do
		if [[ "$current_pos" -eq "$packages_length" ]]; then
			packages_labels+="${package}"
		else
			packages_labels+="${package}, "
		fi

		current_pos=$((current_pos + 1))
	done

	echo "Command line apps: "${packages_labels}
	read -p "Do you want to install essential workflow packages? (y/n) " should_install_packages

	if [ $should_install_packages = 'y' ]
	then
		# Install specified packages, skipping installed packages
		for app in "${cmlApps[@]}"; do
			appName=$( echo "$app" | awk '{print $1}' )
			if brew list "$appName" > /dev/null 2>&1; then
				echo "$appName already installed... skipping."
			else
				brew install "$app"
			fi
		done
	fi

	packages_length=${#guiApps[@]}
	current_pos=1
	packages_labels=""

	for package in "${guiApps[@]}"
	do
		if [[ "$current_pos" -eq "$packages_length" ]]; then
			packages_labels+="${package}"
		else
			packages_labels+="${package}, "
		fi

		current_pos=$((current_pos + 1))
	done

	echo "GUI apps: "${packages_labels}
	read -p "Do you want to install essential workflow packages? (y/n) " should_install_gui_apps

	if [ $should_install_gui_apps = 'y' ]
	then
		# Install specified packages, skipping installed packages
		for app in "${guiApps[@]}"; do
			appName=$( echo "$app" | awk '{print $1}' )
			if brew cask list "$appName" > /dev/null 2>&1; then
				echo "$appName already installed... skipping."
			else
				brew install --cask "$app"
			fi
		done
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

make_zsh_default_shell() {
	read -p "Do you want to make zsh the default shell? (y/n) " should_make_zsh_default_shell

	if [ $should_make_zsh_default_shell = 'y' ]
	then
		chsh -s $(which zsh)
	fi
}

install_vimplug_vim() {
	read -p "Do you want to install vimplug for vim? (y/n) " should_install_vimplug_vim

	if [ $should_install_vimplug_vim = 'y' ]
	then
		echo "Installing vimplug (vim)..."
		curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	fi
}

install_vimplug_neovim() {
	read -p "Do you want to install vimplug for neovim? (y/n) " should_install_vimplug_neovim

	if [ $should_install_vimplug_neovim = 'y' ]
	then
		echo "Installing vimplug (neovim)..."
		curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	fi
}

install_tmux_plugin_manager() {
	read -p "Do you want to install tmux_plugin_manager? (y/n) " should_install_tmux_plugin_manager

	if [ $should_install_tmux_plugin_manager = 'y' ]
	then
		echo "Installing tmux plugin manager"
		git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
	fi
}

install_packages

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

# After the install, setup fzf
echo -e "\\n\\nRunning fzf install script..."
echo "================================"
/usr/local/opt/fzf/install --all

# After the install, install neovim python libraries
echo -e "\\n\\nRunning Neovim Python install..."
echo "================================"
pip3 install pynvim

echo "brew.sh script finished."

# Additional tools/config

# App store: better snap tools
# Dropbox

# Mac mission control:
# - right top corner: mission control
# - right bottom corner: desktop
# - left bottom corner: put display to sleep

# Set terminal font to pragmata pro
# Install tmux plugin manager
