#!/usr/bin/env bash

# Installation script for linux desktop setup

# Directories variables
DIR=`pwd`
WDIR="$HOME/Pictures/wallpapers"
TDIR="$HOME/.themes"
IDIR="$HOME/.icons"
GDIR="$HOME/.local/share/plasma/look-and-feel"
JAP="$HOME/Pictures/wallpapers/japan"
LAND="$HOME/Pictures/wallpapers/landscape"
HIR="$HOME/Pictures/wallpapers/hi-res"

# Install global KDE theme
install_global() {
    echo -e "\n[*] Installing the global KDE theme..."
    if [[ -d "$GDIR" ]]; then
        cp -rf $DIR/$ENV/global/* "$GDIR"
    else
        mkdir -p "$GDIR"
        cp -rf $DIR/$ENV/global/* "$GDIR"
    fi
}

# Install icons
install_icons() {
    echo -e "\n[*] Installing the icons packs..."
    if [[ -d "$IDIR" ]]; then
        cp -rf $DIR/icons/* "$IDIR"
    else
        mkdir -p "$IDIR"
        cp -rf $DIR/icons/* "$IDIR"
    fi
}

# Install wallpapers
## Japanese style
install_japan() {
	echo -e "\n[*] Installing japanese-style wallpapers..."
	if [[ -d "$JAP" ]]; then
		cp -rf $DIR/wallpapers/japan/* "$JAP"
	else
		mkdir -p "$JAP"
		cp -rf $DIR/wallpaper/japan/* "$JAP"
	fi
}

## Landscape style
install_landscape() {
        echo -e "\n[*] Installing landscape wallpapers..."
        if [[ -d "$LAND" ]]; then
            cp -rf $DIR/wallpapers/landscape/* "$LAND"
        else
            mkdir -p "$LAND"
            cp -rf $DIR/wallpapers/landscape/* "$LAND"
        fi
}

## HiRes style
install_hires() {
        echo -e "\n[*] Installing High resolution wallpapers..."
        if [[ -d "$HIR" ]]; then
            cp -rf $DIR/wallpapers/hires/* "$HIR"
        else
            mkdir -p "$HIR"
            cp -rf $DIR/wallpapers/hires/* "$HIR"
        fi
}

# Install Themes and backup the old configs, if existing
install_themes() {
	if [[ -d "$TDIR" ]]; then
		echo -e "[*] Creating a backup of your current themes..."
		mv "$TDIR" "${TDIR}.old"
		{ mkdir -p "$TDIR"; cp -rf $DIR/themes/* "$TDIR"; }
	else
		{ mkdir -p "$TDIR"; cp -rf $DIR/themes* "$TDIR"; }	
	fi
}

# Main themes and icons
main() {
	clear
	cat <<- EOF
		[*] Installing configurations...
		
		[*] `users` Choose your Environment -
		[1] KDE
		[2] XFCE
	
	EOF

	read -p "[?] `users` Select the correct option : "

	if [[ $REPLY == "1" ]]; then
		ENV='kde'
		install_global
	elif [[ $REPLY == "2" ]]; then
		ENV='xfce'
		install_themes
		install_icons
	else
		echo -e "\n[!] Invalid Option, Exiting the script...\n"
		exit 1
	fi
}

main

# Main wallpapers
main() {
	clear
	cat <<- EOF
		[*] Installing wallpapers...
		
		[*] Choose a style -
		[1] Japanese
		[2] Landscape
		[3] HiRes
	
	EOF

	read -p "[?] `users` Select an option : "

	if [[ $REPLY == "1" ]]; then
		STYLE='japanese'
		install_japan
	elif [[ $REPLY == "2" ]]; then
		STYLE='landscape'
		install_landscape
    elif [[ $REPLY == "3" ]]; then
        STYLE='hires'
        install_hires
	else
		echo -e "\n[!] Invalid Option, Exiting the script...\n"
		exit 1
	fi
}

main
