#!/bin/bash

# If Homebrew is not installed, install Homebrew
if test ! "$( command -v brew )"; then
	echo "Installing homebrew"
	ruby -e "$( crl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install )"
fi

echo -e "\\n\\nInstalling homebrew packages..."
echo "================================"

# Specify brew packages to be installed
formulas=(
	cowsay
	ctags
	deno
	figlet
	fzf
	git
	nvm
	ripgrep
	tmux
	vim
)

# Install specified packages, skipping installed packages
for formula in "${formulas[@]}"; do
	formula_name=$( echo "$formula" | awk '{print $1}' )
	if brew list "$formula_name" > /dev/null 2>&1; then
		echo "$formula_name already installed... skipping."
	else
		brew install "$formula"
	fi
done

# After the install, setup fzf
echo -e "\\n\\nRunning fzf install script..."
echo "================================"
/usr/local/opt/fzf/install --all

echo "brew.sh script finished"
