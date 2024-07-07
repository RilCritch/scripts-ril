#!/usr/bin/env bash

## Script for installing my go to Nerd Fonts

## Directory for handling download and extraction
TEMP_DIRECTORY="/tmp/NERD_FONT_INSTALLATION_RC"
mkdir -p ${TEMP_DIRECTORY}

## Function for downloading Nerd Font releases
install-nerd-font() {
	FONT_NAME="${1}"

	curl --output-dir ${TEMP_DIRECTORY} -OL \
	https://github.com/ryanoasis/nerd-fonts/releases/latest/download/${FONT_NAME}.tar.xz

}

## Install specific fonts
install-nerd-font "FiraCode"
install-nerd-font "Hasklig"
install-nerd-font "JetBrainsMono"
install-nerd-font "GeistMono"

## Extract all fonts installed int temporary directory
find "${TEMP_DIRECTORY}" -name "*.tar.xz" -exec tar -xf {} -C "${TEMP_DIRECTORY}" --one-top-level \;
rm ${TEMP_DIRECTORY}/*.tar.xz

## Create fonts directory if needed
mkdir -p ${HOME}/.local/share/fonts

## Move font directories and clean up
mv ${TEMP_DIRECTORY}/* ${HOME}/.local/share/fonts/
rm -r ${TEMP_DIRECTORY}

## Sync new fonts
fc-cache -f -v

