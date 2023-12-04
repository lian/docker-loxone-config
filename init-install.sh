#!/bin/sh
echo
echo
echo
echo
echo
echo "Installing CLEAN LoxoneConfig into ./config/wine directory"
echo
read -p "Press enter to continue"
echo

if [ ! -f "/config/LoxoneConfigSetup.exe" ]; then
  cd /config
  echo "Try to auto download loxone config installer.."
  # urgh, loxone doesn't provide a direct link to latest installer, lets parse out the download link while we cry a little
  wget -O i.zip $(wget -O - https://www.loxone.com/enen/support/downloads/ | sed -r 's~(href="|src=")([^"]+).*~\n\1\2~g' | awk -F"=\"" '{print $2}' | grep LoxoneConfigSetup_ |head -1)
  unzip i.zip && rm i.zip

  if [ ! -f "/config/LoxoneConfigSetup.exe" ]; then
    echo "ERROR: ./config/LoxoneConfigSetup.exe missing! auto download failed too! please put installer file there.."
    exit 1
  fi
fi

export WINEDEBUG=-all

echo Installing winetricks helper for fonts and sharper rendering..
/usr/bin/winetricks fontsmooth-rgb
#/usr/bin/winetricks corefonts
/usr/bin/winetricks gdiplus
echo Installing LoxoneConfig..
wine "/config/LoxoneConfigSetup.exe"
echo Install finished. yay!
exit 0
