#!/bin/bash

INSTALLATION=`which port` 
if [ $? -eq 1 ]; then
	return 1;
fi

alias portcleanup='sudo port selfupdate; sudo port uninstall inactive; sudo port uninstall leaves; sudo port uninstall leaves; sudo port uninstall leaves; sudo port uninstall leaves; sudo port uninstall leaves; sudo port uninstall leaves; sudo port uninstall leaves; sudo port uninstall inactive; sudo port clean all'

export OPTLOCAL_PATHS="/usr/sbin:1/usr/bin:/usr/local:/usr/local/bin:/usr/local/sbin"
export OPTLOCAL_MANPATH="/opt/local/share/man"
export OPTLOCAL_CLASSPATHS="/opt/local/share/java/*:/opt/local/share/java/*/lib/*:/opt/local/share/java/*/*/lib/*"
export OPTLOCAL_MYSQL="/opt/local/lib/mysql/bin"
export MANPATH="$OPTLOCAL_MANPATH:$MANPATH"
export PATH="$OPTLOCAL_PATHS:$OPTLOCAL_MYSQL:$PATH"