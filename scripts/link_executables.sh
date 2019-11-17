# Create $HOME/bin directory if it doesn't exists
echo 'Creating $HOME/bin directory...' # Literal echo with single quote
mkdir -p ${HOME}/bin

executables=("ide")
dir="${HOME}/Documents/dotfiles/bin"

# For each specified executable, create symbolic link
# -s Create a symbolic link
# -f If the target file already exists, then unlink it so that the link may occur
for executable in "${executables[@]}";do
	ln -sfv "${dir}/${executable}" "${HOME}/bin"
done
