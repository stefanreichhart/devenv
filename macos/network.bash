#!/bin/bash

# network shortcuts
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
alias ip='ifconfig -a'
alias wan='dig +short myip.opendns.com @resolver1.opendns.com'
alias lan="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"

