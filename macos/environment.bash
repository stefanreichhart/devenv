#!/bin/bash

BASH_DIR=`dirname $BASH_SOURCE`

# environment
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

export USERNAME=`id -un | tr '[A-Z]' '[a-z]'`
export MACHINE_NAME=`hostname -s`

# java configuration
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

export CLASSPATH="$CLASSPATH:$OPTLOCAL_CLASSPATHS"
#export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_102.jdk/Contents/Home"
export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk11/Contents/Home
export DERBY_HOME="$JAVA_HOME/db"

alias derbyinfo="java -jar $DERBY_HOME/lib/derbyrun.jar sysinfo"

# android sdk
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

export ANDROID="/adt/sdk/build-tools:/adt/sdk/platform-tools:/adt/sdk/platform-tools:/adt/sdk/tools:/adt/tools:/adt/tools/bin:/adt/flutter/bin"

# macports
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

export OPTLOCAL_PATHS="/usr/sbin:1/usr/bin:/usr/local:/usr/local/bin:/usr/local/sbin"
export OPTLOCAL_MANPATH="/opt/local/share/man"
export OPTLOCAL_CLASSPATHS="/opt/local/share/java/*:/opt/local/share/java/*/lib/*:/opt/local/share/java/*/*/lib/*"
export OPTLOCAL_MYSQL="/opt/local/lib/mysql/bin"

# devenv configuration
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

export PROFILE_PATH="$BASH_DIR"
alias prf='cd $PROFILE_PATH'

export SCRIPTS_PATH="$BASH_DIR/scripts"
alias scr='cd $SCRIPTS_PATH'

# FINISH $PATH
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

export MANPATH="$OPTLOCAL_MANPATH:$MANPATH"
export PATH="$SCRIPTS_PATH:$OPTLOCAL_PATHS:$OPTLOCAL_MYSQL:$ANDROID:$JAVA_HOME:$DERBY_HOME:$PATH"

# python configuration
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

export PYTHONPATH="$PYTHONPATH:$PATH"