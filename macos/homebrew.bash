#!/bin/bash

INSTALLATION=`which brew` 
if [ $? -eq 1 ]; then
	return 0;
fi

alias brewinstalldev='brew install clojure elixir erlang ffmpeg flac fontforge ghostscript imagemagick kotlin lame less lua lynx maven openjdk perl pstree python rsync rust scala siege wget wput'