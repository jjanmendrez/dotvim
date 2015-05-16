#!/bin/bash
dist=$(gawk -F= '/^NAME/{print $2}' /etc/os-release | sed 's/"//g')
fontDir="$HOME/.fonts/patched-fonts"

if [ "$dist" == "Arch Linux" ]; then
	set -e
	#Install subversion
	if [ -x /usr/bin/svn ]; then
		echo "Subversion is already installed."
	else
		echo "Installing Subversion"
		sudo pacman --noconfirm -S subversion
	fi

	#Download fonts
	if [ -d "$fontDir" ]; then
		echo "Fonts already installed in $fontDir"
		exit 0
	else
		echo "Installing fonts"
		/usr/bin/svn export https://github.com/ryanoasis/nerd-filetype-glyphs-fonts-patcher/trunk/patched-fonts ~/.fonts/patched-fonts 2>/dev/null &

		pid=$! # Process Id of the previous running command
		spin='-\|/'
		i=0
		while kill -0 $pid 2>/dev/null
		do
			i=$(( (i+1) %4 ))
			printf "\r${spin:$i:1}"
			sleep .1
		done

		sleep 2

		echo "Updating fontconfig font cache."

		sleep 2

		mkfontscale "$fontDir"
		mkfontdir "$fontDir"
		#refresh fonts
		xset +fp "$fontDir"
		xset fp rehash
		#spinner 
		/usr/bin/fc-cache -f 2>/dev/null &
		pid=$! # Process Id of the previous running command
		spin='-\|/'
		i=0
		while kill -0 $pid 2>/dev/null
		do
			i=$(( (i+1) %4 ))
			printf "\r${spin:$i:1}"
			sleep .1
		done

		clear

		sleep 1

		echo "Fonts Installed!"
	fi
else
	echo "Just install the fonts manually."
fi
