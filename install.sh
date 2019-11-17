#!/bin/bash

command_exists() {
	type "$1" > /dev/null 2>&1
}

echo "Linking dotfiles..."
source install/link.sh

# echo "Setting up git meta..."
# source install/git.sh

# only perform macOS-specific install
if [ "$(uname)" == "Darwin" ]; then
	echo -e "\n\nRunning on macOS"
	source install/brew.sh
fi

echo "install.sh script finished. Reload your terminal."
