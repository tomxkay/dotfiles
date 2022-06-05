#!/bin/bash
mkdir -p ~/.config/nvim/plugin
mkdir -p ~/.config/nvim/after/plugin
mkdir -p ~/.config/nvim/lua/plugins

SOURCE=~/Documents/dotfiles/config
DEST=~/.config/nvim/

for file in `find . -regex ".*\.lua$"`; do
	rm -rf $DEST/$file
	ln -sfv $SOURCE/$file $DEST/$file
done

for file in `find . -regex ".*\.vim$"`; do
	rm -rf $DEST/$file
	ln -sfv $SOURCE/$file $DEST/$file
done
