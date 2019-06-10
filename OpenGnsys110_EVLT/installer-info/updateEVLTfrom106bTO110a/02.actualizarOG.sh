#!/bin/bash
echo "fase 1: descarga del targz" 
cd /root/
echo "descargamos la version de febrero de 2019"
VERSION=opengnsys-1.1.0a-r20190225.a49bcdc.tar.gz
# versión enero 2019
#VERSION=opengnsys-1.1.0a-r20190116.d83d715.tar.gz
wget https://opengnsys.es/trac/downloads/$VERSION && echo "fase 2: Descarga TARGZ OK" || echo "fase 1: Problemas con la Descarga TARGZ"
cp /root/$VERSION /tmp 
cd /tmp/ 
rm -fr /tmp/opengnsys
rm -fr /tmp/opengnsys_update
tar xzvf $VERSION 
echo "fase 3 actualizamos" 
cd /tmp/ 
/tmp/opengnsys/installer/opengnsys_update.sh
/tmp/opengnsys/installer/opengnsys_update.sh
