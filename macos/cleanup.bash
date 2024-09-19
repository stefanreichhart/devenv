#!/bin/bash

# cleanup shortcuts
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

alias xclean='find . -name "*DS_Store" -print -delete; find . -name "._*" -print -delete'
alias xcleanquiet='find . -name "*DS_Store" -delete; find . -name "._*" -delete'
alias jclean='find . -name "*.class" -delete'
alias pyclean='find . -name "*.pyc" -delete'
alias xcodeclean='rm -rdf ~/Library/Developer/Xcode/DerivedData/'
