# force platfrom=linux/386 because alpine x64 doesn't support wine32 and LoxoneConfig is win32
FROM --platform=linux/386 jlesage/baseimage-gui:alpine-3.18-v4.5

ARG XLANG=de

RUN add-pkg wine wget xterm cabextract xkeyboard-config setxkbmap
RUN wget -O /usr/bin/winetricks https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks && \
  chmod +x /usr/bin/winetricks

COPY init-install.sh /init-install.sh
COPY startapp.sh /startapp.sh

# Set remote resizing as default
# https://github.com/jlesage/docker-baseimage-gui/issues/112
RUN sed -i "s/resize = 'scale';/resize = 'remote';/g" /opt/noVNC/app/ui.js

# ensure script permissions
RUN chmod a+rx /startapp.sh && chmod a+rx /init-install.sh

RUN set-cont-env APP_NAME "Loxone Config"
