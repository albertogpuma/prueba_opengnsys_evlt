#!/bin/bash
#---
#vi /opt/opengnsys/lib/install_evlt110.sh
#---
DIA=`date +"%d%m%Y"`
HORA=`date +"%H%M"`

cd /opt/opengnsys/
if [ ! -d "modulosEVLT" ]; then
	mkdir modulosEVLT
fi


if [ -d "modulosEVLT" ]; then
	mv /opt/opengnsys/modulosEVLT/opengnsys_evlt/ /opt/opengnsys/modulosEVLT/OpenGnsys110_EVLT.OLD.$DIA.$HORA
fi
cd /opt/opengnsys/modulosEVLT/
git clone https://ogevltuser@bitbucket.org/ogevltrepo/opengnsys_evlt.git
git pull
  
chmod -R 777 /opt/opengnsys/modulosEVLT/opengnsys_evlt/OpenGnsys110_EVLT/*


echo "pulse una tecla para Incluir el codigo de los modulos para la 110"
read n
rm /opt/opengnsys/modulosEVLT/opengnsys_evlt/OpenGnsys110_EVLT/installer-info/install_evlt110.sh 
cd /opt/opengnsys/
cp -prv /opt/opengnsys/modulosEVLT/opengnsys_evlt/OpenGnsys110_EVLT/* ./
cp -prv /opt/opengnsys/modulosEVLT/opengnsys_evlt/OpenGnsys110_EVLT/tftpboot/* /var/lib/tftpboot/

rm -fr /opt/opengnsys/installer-info


head -15 /opt/opengnsys/modulosEVLT/opengnsys_evlt/OpenGnsys110_EVLT/installer-info/version.txt

echo "Copiando el fichero /opt/opengnsys/client/etc/os.cfg desde el 10.242"
scp root@172.17.10.242:/opt/repoapp/opengnsys/client/etc/os.cfg /opt/opengnsys/client/etc/

 
exit

#cat /opt/opengnsys/www/includes/tftputils.php | grep oglive
#wget https://opengnsys.es/trac/export/5763/branches/version1.1-tickets/Iniciar.Sistema.Restaurado-ticket824/installer-info/install.sh -O /opt/opengnsys/lib/install_evlt_IniciarSistemaRestaurado.sh
#chmod 777 /opt/opengnsys/lib/install_evlt_IniciarSistemaRestaurado.sh
#exit 