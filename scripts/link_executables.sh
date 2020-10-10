function getExecScriptPwd {
	# Get full dir of script, resolving symlink
	SOURCE="${BASH_SOURCE[0]}"

	while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
		DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
		SOURCE="$(readlink "$SOURCE")"
		[[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
	done

	DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"

	local EXECSCRIPTPWD="$(dirname "$DIR")"

	echo $EXECSCRIPTPWD
}

# Create $HOME/bin directory if it doesn't exists
echo 'Creating $HOME/bin directory...' # Literal echo with single quote
mkdir -p ${HOME}/bin

executables=(
	"ide"
	"development.sh"
)

DIR=$(getExecScriptPwd)

# For each specified executable, create symbolic link
# -s Create a symbolic link
# -f If the target file already exists, then unlink it so that the link may occur
for executable in "${executables[@]}";do
	ln -sfv "${DIR}/bin/${executable}" "${HOME}/bin"
done
