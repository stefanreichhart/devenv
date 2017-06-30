#!/bin/bash

# Configuration
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

ENVIRONMENT=`uname -o | tr -t [:upper:] [:lower:]`

SRC_PROFILE="./profile/profile"

SRC_GIT_CONFIG="./git/gitconfig"
SRC_GIT_IGNORE="./git/gitignore"

SRC_SSH_CONFIG="./ssh/config"

SRC_SSH_BITBUCKET="./ssh/id_rsa_bitbucket"
SRC_SSH_BITBUCKET_PUB="./ssh/id_rsa_bitbucket.pub"

SRC_SSH_GITHUB="$./ssh/id_rsa_github"
SRC_SSH_GITHUB_PUB="$./ssh/id_rsa_github.pub"

# Functions
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

function make_directory {
	if [ -z "$1" ]; then
		echo "[ERROR] Undefined directory ($2: $1)"
	else
		echo "Installing directory ($2: $1)"
		mkdir -p "$1"
	fi
}

function make_symlink {
	if [ -f "$1" ]; then
		echo "Installing symlink ($1 ---> $2)"
		ln -fs "$1" "$2"
	else
		echo "[ERROR] invalid symlink ($1 ---> $2)"
	fi
}

# Setup
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

if [ "$ENVIRONMENT" != "cygwin" ]; then
	echo "[ERROR] invalid environment ($ENVIRONMENT)"
	exit 1
fi

if  [ -f "$SRC_PROFILE" ]; then
	source "$SRC_PROFILE"
else
	echo "[ERROR] profile ($SRC_PROFILE) not found"
	exit 1
fi

DST_PROFILE="$HOME/.profile"
DST_GIT_CONFIG="$HOME/gitconfig"
DST_GIT_IGNORE="$HOME/gitignore"
DST_SSH="$HOME/.ssh"
DST_SSH_CONFIG="$DST_SSH/config"
DST_SSH_BITBUCKET="$DST_SSH/id_rsa_bitbucket"
DST_SSH_BITBUCKET_PUB="$DST_SSH/id_rsa_bitbucket.pub"
DST_SSH_GITHUB="$DST_SSH/id_rsa_github"
DST_SSH_GITHUB_PUB="$DST_SSH/id_rsa_github.pub"

make_directory "$PRF" "Profile"
make_directory "$SCR" "Scripts"
make_directory "$PRJ" "Projects"
make_directory "$TMP" "Temporary"

if [ -f "$SRC_GIT_IGNORE" ]; then
	make_symlink "$SRC_GIT_IGNORE" "$HOME/.gitignore"
fi

if [ -f "$SRC_GIT_CONFIG" ]; then
	make_symlink "$SRC_GIT_CONFIG" "$HOME/.gitconfig"
fi

if [ -e "$SRC_SSH_CONFIG" ]; then
	make_directory "$DST_SSH"
	make_symlink "$SRC_SSH_CONFIG" "$DST_SSH_CONFIG"
else
	echo "[WARNING] Bypassing ssh-config ..."
fi

if [ -f "$SRC_SSH_BITBUCKET" -a -f "$SRC_SSH_BITBUCKET_PUB" ]; then
	make_directory "$DST_SSH"
	make_symlink "$SRC_SSH_BITBUCKET" "$DST_SSH_BITBUCKET"
	make_symlink "$SRC_SSH_BITBUCKET_PUB" "$DST_SSH_BITBUCKET_PUB"
else
	echo "[WARNING] Bypassing bitbucket ssh-keys ..."
fi

if [ -f "$SRC_SSH_GITHUB" -a -f "$SRC_SSH_GITHUB_PUB" ]; then
	make_directory "$DST_SSH"
	make_symlink "$SRC_SSH_GITHUB" "$DST_SSH_GITHUB"
	make_symlink "$SRC_SSH_GITHUB_PUB" "$DST_SSH_GITHUB_PUB"
else
	echo "[WARNING] Bypassing github ssh-keys ..."
fi

if [ -e "$DST_PROFILE" ]; then
	if [ "$1" == "-o" ]; then
		DATE=`date +"%Y-%m-%d_%H-%M-%S"`
		BAK_PROFILE="${DST_PROFILE}_$DATE"
		echo "Overriding existing .profile (backup: $BAK_PROFILE)"
		mv -f "$DST_PROFILE" "$BAK_PROFILE"
		cp "$SRC_PROFILE" "$DST_PROFILE"
	else
		echo "[ERROR] Profile already exists ($DST_PROFILE). Override using -o"
		exit 1
	fi
else
	echo "Installing new .profile"
	cp "$SRC_PROFILE" "$DST_PROFILE"
fi

echo "Done"