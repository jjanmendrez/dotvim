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
		echo "Fonts already installed in "$fontDir""
		exit 0
	else
		echo "Installing fonts"
		svn export --force https://github.com/ryanoasis/nerd-filetype-glyphs-fonts-patcher/trunk/patched-fonts ~/.fonts/patched-fonts
		#refresh fonts
		sleep 5
		echo "Refreshing font cache"
		xset +fp "$fontDir"
		xset fp rehash
		fc-cache -vf
		sleep 5
	fi
else
	echo "Just install the fonts manually."
fi
