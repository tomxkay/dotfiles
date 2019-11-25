#!/usr/bin/bash

# Automatically install purchased apps from the Mac App Store

mas signout

read -r -t 60 -p "What is your Apple Id?: " appleid
mas signin --dialog "$appleid"

# Mac App Store apps to install
apps=(
	"Amphetamine: <PRODUCT IDENTIFIER GOES HERE>"
)

for app in "${apps[@]}"; do
	name=${app%%:*}
	id=${app#*:}

	echo -e "Attempting to install $name"
	mas install "$id"
done
