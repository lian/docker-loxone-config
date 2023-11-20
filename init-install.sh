#!/bin/sh
echo
echo
echo "Installing clean loxone config into ./config/wine directory"
echo
read -p "Press enter to continue"
echo

if [ ! -f "/config/LoxoneConfigSetup.exe" ]; then
	echo "ERROR: ./config/LoxoneConfigSetup.exe missing! please put installer file there.."
	exit 1
fi

export WINEDEBUG=-all

echo Installing winetricks helper for fonts and sharper rendering..
#/usr/bin/winetricks fontsmooth-rgb
#/usr/bin/winetricks corefonts
/usr/bin/winetricks gdiplus
echo Installing LoxoneConfig..
wine "/config/LoxoneConfigSetup.exe"
echo Install finished. yay!
exit 0
