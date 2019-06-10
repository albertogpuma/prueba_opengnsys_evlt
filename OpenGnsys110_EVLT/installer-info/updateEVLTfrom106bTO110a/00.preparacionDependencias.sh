#!/bin/bash
echo "fase 0 actualizando paquetes" 
sed -i s/proxy.satd.uma.es/proxy.aulas.uma.es/g /etc/subversion/servers 
sed -i s/proxy.satd.uma.es/proxy.aulas.uma.es/g /etc/bash.bashrc 
sed -i s/proxy.satd.uma.es/proxy.aulas.uma.es/g /etc/wgetrc 
apt-get update && echo "fase 0: Red OK" || echo "fase 0: Problemas con la red" 
apt-get install -y --force-yes -q jq git 
