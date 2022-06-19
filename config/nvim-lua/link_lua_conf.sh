#!/bin/bash
mkdir -p ~/.config/nvim/plugin
mkdir -p ~/.config/nvim/after/plugin
mkdir -p ~/.config/nvim/lua/plugins

# get script absolute path regardless of calling from location
SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

SOURCE=$SCRIPTPATH
NVIM_LUA_CONFIG_DIR=$SOURCE
DEST=~/.config/nvim

for file_path in `find $NVIM_LUA_CONFIG_DIR -regex ".*\.lua$"`; do
	relative_file_path=$(realpath --relative-to=$NVIM_LUA_CONFIG_DIR $file_path)

	rm -rf $DEST/$relative_file_path
	ln -sfv $SOURCE/$relative_file_path $DEST/$relative_file_path
done

for file_path in `find $NVIM_LUA_CONFIG_DIR -regex ".*\.vim$"`; do
	relative_file_path=$(realpath --relative-to=$NVIM_LUA_CONFIG_DIR $file_path)

	rm -rf $DEST/$relative_file_path
	ln -sfv $SOURCE/$relative_file_path $DEST/$relative_file_path
done
