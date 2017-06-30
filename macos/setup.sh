#!/bin/sh

# setup functions 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

BASH_DIR=`dirname $BASH_SOURCE`

DATE_NOW=`date +"%Y-%m-%d_%H:%M:%S"`

function copy_file {
	if [ -z "$1" -o ! -f "$1" ]; then
		echo "[ERROR] No such file or directory ($1)"
	else
		if [ -z "$2" ]; then
			echo "[ERROR] No such file or directory ($2)"
		else
			if [ -f "$2" ]; then
				BAK="$2.$DATE_NOW.bak"
				echo "Backup old file ($2 => $BAK)"
				mv "$2" "$BAK"
			fi
			cp -np "$1" "$2"
		fi
	fi
}

# copy files (symliks don't work)
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

copy_file ../git/gitignore ~/.gitignore
copy_file ../git/gitconfig ~/.gitconfig

# source profile 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

IS_SETUP=`test -f ~/.profile && cat ~/.profile | grep -c "/profile.bash"`
IS_OK=$?
if [ "0" != "$IS_SETUP" -o "0" != "$IS_OK" ]; then
	PROFILE="`pwd`/profile.bash"
	if [ -f "$PROFILE" ]; then
		echo "" >> ~/.profile
		echo "source $PROFILE" >> ~/.profile
	else
		echo "[ERROR] No such file or directory ($PROFILE)"
	fi
fi

# finished

echo "done"