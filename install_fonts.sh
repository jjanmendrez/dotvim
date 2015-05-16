#!/bin/bash
dist=$(gawk -F= '/^NAME/{print $2}' /etc/os-release | sed 's/"//g')
fontDir="$HOME/.fonts/patched-fonts"

if [ "$dist" == "Arch Linux" ]; then
    set -e
	echo "Installing subversion"

	#Install subversion
    sudo pacman --noconfirm -S subversion


	#Download fonts

    if [ -d "$fontDir" ]; then
        echo "Fonts already installed in ~/.fonts/patched-fonts"
        exit 0
    else
        echo "Installing fonts"
	    svn export --force https://github.com/ryanoasis/nerd-filetype-glyphs-fonts-patcher/trunk/patched-fonts ~/.fonts/patched-fonts
	cd "$fontDir" && mkfontscale && mkfontdir
	#refresh fonts
	echo "Refreshing font cache"
	xset +fp "$fontDir"
	xset fp rehash
    fi
else
	echo "Just install the fonts manually."
fi
