#!/bin/bash
z="$PWD/vim/bundle/YouCompleteMe"
if [ ! -d "$z" ]; then

	echo "Please run ./install script first"
	
else

	if [ -x /usr/bin/cmake ]; then

		echo "Cmake already installed..."
	        echo "Configuring YouCompleteMe..."

		sleep 2

		"$z"/install.sh --clang-completer

	else

		sudo pacman --noconfirm -S cmake

	fi

fi
