#!/bin/sh

if [ ! -d "/config/wine/drive_c" ]; then
  xterm -e "/init-install.sh" || exit 1
fi

export WINEDEBUG=-all
#exec xterm
exec wine "/config/wine/drive_c/Program Files/Loxone/LoxoneConfig/LoxoneConfig.exe"
