#!/bin/bash

BASH_DIR=`dirname $BASH_SOURCE`

# environment
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

export USERNAME=`id -un | tr '[A-Z]' '[a-z]'`
export MACHINE_NAME=`hostname -s`

# devenv configuration
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

export PROFILE_PATH="$BASH_DIR"
alias prf='cd $PROFILE_PATH'

export SCRIPTS_PATH="$BASH_DIR/scripts"
export PATH="$PATH:$SCRIPTS_PATH"
alias scr='cd $SCRIPTS_PATH'

