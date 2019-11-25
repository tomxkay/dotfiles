#!/bin/bash

# If Homebrew is not installed, install Homebrew
if test ! "$( command -v brew )"; then
	echo "Homebrew not installed. Installing homebrew..."
	ruby -e "$( crl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install )"
fi

echo -e "\\n\\nInstalling homebrew packages..."
echo "================================"

# Specify brew packages to be installed
formulas=(
	cmake
	ctags
	deno
	fzf
	git
	macvim
	mas
	neovim
	nvm
	python
	ripgrep
	tmux
	vim
	wget
	zsh
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

# After the install, install neovim python libraries
echo -e "\\n\\nRunning Neovim Python install..."
echo "================================"
pip3 install pynvim

echo "brew.sh script finished."
