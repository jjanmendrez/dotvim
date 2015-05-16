#!/bin/bash
dist=`gawk -F= '/^NAME/{print $2}' /etc/os-release | sed 's/"//g'`

if [ "$dist" == "Arch Linux" ]; then
	echo "Installing subversion"

	#Install subversion
	pacman --noconfirm -S subversion

	#Download fonts
	echo "Downloading fonts"
	svn export https://github.com/ryanoasis/nerd-filetype-glyphs-fonts-patcher/trunk/patched-fonts ~/.fonts

	#refresh fonts
	echo "Refreshing font cache"
	xset +fp $HOME/.fonts
	xset fp rehash
else
	echo "Just install these fonts manually, it's not that hard"
fi
