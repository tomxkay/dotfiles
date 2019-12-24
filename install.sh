#!/bin/bash
command_exists() {
	type "$1" > /dev/null 2>&1
}

unameOutput="$(uname -s)"
case "${unameOutput}" in
	Linux*)     machine=Linux;;
	Darwin*)    machine=Mac;;
	CYGWIN*)    machine=Cygwin;;
	MINGW*)     machine=MinGw;;
	*)          machine="UNKNOWN:${unameOutput}"
esac
echo Machine type is ${machine}

echo "Linking dotfiles..."
source scripts/link_dotfiles.sh

echo "Linking bin executables..."
source scripts/link_executables.sh

echo "Setting up git meta..."
source scripts/git.sh

# Linux specific install
if [ "$machine" == "Linux" ]; then
	echo -e "\nRunning on linux"
	source scripts/linux-install.sh
fi

# macOS  specific install
if [ "$machine" == "Darwin" ]; then
	echo -e "\n\nRunning on macOS"
	source scripts/brew.sh
fi

echo "install.sh script finished. Reload your terminal."
