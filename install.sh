#!/bin/bash

command_exists() {
	type "$1" > /dev/null 2>&1
}

echo "Linking dotfiles..."
source install/link_dotfiles.sh

echo "Linking bin executables..."
source install/link_executables.sh

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# echo "Setting up git meta..."
# source install/git.sh

# only perform macOS-specific install
if [ "$(uname)" == "Darwin" ]; then
	echo -e "\n\nRunning on macOS"
	source install/brew.sh
fi

echo "install.sh script finished. Reload your terminal."
