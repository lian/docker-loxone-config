#!/bin/sh

if [ ! -d "/config/wine/drive_c" ]; then
	if [ ! -f "/config/LoxoneConfigSetup.exe" ]; then
		echo "\n\nERROR: ./config/LoxoneConfigSetup.exe missing! please put installer file there..\n\n"
		exit 1
	fi
  xterm -e "/init-install.sh" || exit 1
fi

export WINEDEBUG=-all
#exec xterm
exec wine "/config/wine/drive_c/Program Files/Loxone/LoxoneConfig/LoxoneConfig.exe"
