#!/bin/bash

# Common utils
command_exists() {
	command -v "$1" &>/dev/null
}

# # Usage
# if ! command_exists 'git'; then
# 	some action
# else
# 	some other action
# fi

###############################################################################
###############################################################################

# Fonts config
bold=$(tput bold)
underline=$(tput sgr 0 1)
reset=$(tput sgr0)

purple=$(tput setaf 171)
red=$(tput setaf 1)
green=$(tput setaf 76)
tan=$(tput setaf 3)
blue=$(tput setaf 38)

# Headers and Logging
echo_header() { printf "\n${bold}${purple}==========  %s  ==========${reset}\n" "$@"; }
echo_arrow() { printf "➜ $@\n"; }
echo_success() { printf "${green}✔ %s${reset}\n" "$@"; }
echo_error() { printf "${red}✖ %s${reset}\n" "$@"; }
echo_warning() { printf "${tan}➜ %s${reset}\n" "$@"; }
echo_underline() { printf "${underline}${bold}%s${reset}\n" "$@"; }
echo_bold() { printf "${bold}%s${reset}\n" "$@"; }
echo_note() { printf "${underline}${bold}${blue}Note:${reset} ${blue}%s${reset}\n" "$@"; }

###############################################################################
###############################################################################

# User input
ask_confirmation() {
  printf "\n${bold}$@${reset}"
  read -p " (y/n) " -n 1
  printf "\n"
}

is_confirmed() {
if [[ "$REPLY" =~ ^[Yy]$ ]]; then
  return 0
fi
return 1
}

# Usage
# ask_confirmation "question"
# if is_confirmed; then
# 	some action
# else
# 	some other action
# fi

###############################################################################
###############################################################################

# Check OS
get_os() {
	unameOutput="$(uname -s)"
	case "${unameOutput}" in
		Linux*)     machine=Linux;;
		Darwin*)    machine=Mac;;
		CYGWIN*)    machine=Cygwin;;
		MINGW*)     machine=MinGw;;
		*)          machine="UNKNOWN:${unameOutput}"
	esac

	echo $machine
}

is_mac() {
	os=$(get_os)

	if [ $os == "Mac" ]; then
		echo 1
	else
		echo 0
	fi
}

is_linux() {
	os=$(get_os)

	if [ $os == "Linux" ]; then
		echo 1
	else
		echo 0
	fi
}

# Usage
# if [[ $(is_mac) -eq 1 ]]; then
# fi


###############################################################################
###############################################################################

pushover () {
  PUSHOVERURL="https://api.pushover.net/1/messages.json"
  API_KEY=$PUSHOVER_API_KEY
  USER_KEY=$PUSHOVER_USER_KEY
	DEVICE=$(hostname)

  TITLE="${1}"
  MESSAGE="${2}"

  curl \
  -F "token=${API_KEY}" \
  -F "user=${USER_KEY}" \
  -F "device=${DEVICE}" \
  -F "title=${TITLE}" \
  -F "message=${MESSAGE}" \
  "${PUSHOVERURL}" > /dev/null 2>&1
}

# Usage
# pushover "title" "message"

