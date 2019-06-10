#!/bin/bash
# Proceso general de arranque de OpenGnsys Client.


# Fichero de registro de incidencias (en el servidor; si no, en local).
OPENGNSYS=${OPENGNSYS:-/opt/opengnsys}
OGLOGFILE=${OGLOGFILE:-$OPENGNSYS/log/$(ogGetIpAdderss).log}
if ! touch $OGLOGFILE 2>/dev/null; then
    OGLOGFILE=/var/log/opengnsys.log
fi
LOGLEVEL=5

# Matando plymount para inicir browser o shell
pkill -9 plymouthd

# Arranque de OpenGnsys Client daemon (socket).
echo "${MSG_LAUNCHCLIENT:-.}"
# Indicar fichero de teclado de Qt para el idioma especificado (tipo "es.qmap").
[ -f /usr/local/etc/${LANG%_*}.qmap ] && export QWS_KEYBOARD="TTY:keymap=/usr/local/etc/${LANG%_*}.qmap"

if [ -x "$OPENGNSYS/bin/ogAdmClient" -a "$ogstatus" != "offline"  ]; then
    # ADV Si iniciamos el PCVIRTUAL y el ogAdmLnxClient
	if cat /proc/cmdline | grep PCVIRTUAL; then
		/opt/opengnsys/etc/preinit/thinclientservice.sh
cat > /tmp/ogAdmLnxClient.cfg << EOT
ServidorAdm=$(ogGetServerIp)
PUERTO=2008
IPLOCAL=$(ogGetIpAddress)
EOT
		$OPENGNSYS/bin/ogAdmLnxClient -f /tmp/ogAdmLnxClient.cfg &
		# $OPENGNSYS/bin/ogAdmClientPCVIRTUALIP -f $OPENGNSYS/etc/ogAdmClientFirefox.cfg -l $OGLOGFILE -d $LOGLEVEL
		/opt/opengnsys/scripts/PCVIRTUALIP.sh
		exit
	fi
	#ADV FIN PCVIRTUAL
    # Ejecutar servicio cliente.
    $OPENGNSYS/bin/ogAdmClient -f $OPENGNSYS/etc/ogAdmClient.cfg -l $OGLOGFILE -d $LOGLEVEL
else
    for FILE in index $OGGROUP $(ogGetIpAddress)
    do
	[ -f $OGCAC/menus/$FILE.html ] && OGMENU="$OGCAC/menus/$FILE.html"
    done
    $OPENGNSYS/bin/browser -qws $OGMENU
fi

# Si fallo en cliente y modo "admin", cargar shell; si no, salir.
if [ "$ogactiveadmin" == "true" ]; then
    bash
fi