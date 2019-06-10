#!/bin/bash
echo "Instalando modulos EVLT para Og 1.1.0a"
cat /opt/opengnsys/doc/VERSION.txt  | grep 1.1.0a || (echo "version 1.1.0a no detectada"; exit 1)
cd /tmp/
git clone https://ogevltuser:evltuser@bitbucket.org/ogevltrepo/opengnsys_evlt.git
cp -prv /tmp/opengnsys_evlt/OpenGnsys110_EVLT/* /opt/opengnsys/
cp -prv /tmp/opengnsys_evlt/OpenGnsys110_EVLT/tftpboot/* /var/lib/tftpboot/
chmod +x /opt/opengnsys/client/scripts/{createImageCustom,configureOsCustom}
chmod +x /opt/opengnsys/client/etc/preinit/*.sh

