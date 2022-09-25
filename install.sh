#!/bin/bash

unameOutput="$(uname -s)"
case "${unameOutput}" in
	Linux*)     machine=Linux;;
	Darwin*)    machine=Mac;;
	CYGWIN*)    machine=Cygwin;;
	MINGW*)     machine=MinGw;;
	*)          machine="UNKNOWN:${unameOutput}"
esac
echo Machine type is ${machine}

read -p "Do you want to symlink dotfiles? (y/n) " should_link_dotfiles
if [ $should_link_dotfiles = 'y' ]
then
	echo "Linking dotfiles..."
	source scripts/link_dotfiles.sh
fi

read -p "Do you want to symlink executables? (y/n) " should_link_executables
if [ $should_link_executables = 'y' ]
then
	echo "Linking bin executables..."
	source scripts/link_executables.sh
fi

read -p "Do you want to set up git meta? (y/n) " should_set_up_git_meta
if [ $should_set_up_git_meta = 'y' ]
then
	echo "Setting up git meta..."
	source scripts/git.sh
fi

read -p "Do you want run install script for $machine? (y/n) " should_install_script
if [ $should_install_script = 'y' ]
then
	# Linux specific install
	if [ "$machine" == "Linux" ]; then
		echo -e "\nRunning install script on linux"
		source scripts/linux-install.sh
	fi

	# macOS  specific install
	if [ "$machine" == "Mac" ]; then
		echo -e "\n\nRunning install script on macOS"
		source scripts/brew.sh
		source scripts/macos.sh
	fi
fi

echo "install.sh script finished. Reload your terminal."
