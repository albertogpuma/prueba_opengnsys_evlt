#!/bin/bash
mkdir -p /opt/og106b/{lib,client}
mv /opt/opengnsys/tickets /opt/og106b/
mv /opt/opengnsys/lib/* /opt/og106b/lib/
mv /opt/opengnsys/client/{bin,boot-tools,compatibilidad,interfaceAdm,lib,scripts,scripts-systemmenu-borrar} /opt/og106b/client/
echo "cosas que no se actualizan client/{etc,log}"
echo "las plantillas antiguas (00menusystem, 18ogLiveExperimental, 00PcVirtual) las sobreescrimos con un arranque normal de pxe".
cp /opt/opengnsys/tftpboot/menu.lst/templates/pxe /opt/opengnsys/tftpboot/menu.lst/templates/00MenuSystem
cp /opt/opengnsys/tftpboot/menu.lst/templates/pxe /opt/opengnsys/tftpboot/menu.lst/templates/18ogLiveEXPERIMENTAL
cp /opt/opengnsys/tftpboot/menu.lst/templates/pxe /opt/opengnsys/tftpboot/menu.lst/templates/00PCVirtual
echo "las plantillas antiguas (00menusystem, 18ogLiveExperimental, 00PcVirtual) les cambiamos el nombre para que en el netboot aparezcan no usar".
sed -i s/"##NO-TOCAR-ESTA-LINEA".*/"##NO-TOCAR-ESTA-LINEA NoUSAR"/g /opt/opengnsys/tftpboot/menu.lst/templates/00MenuSystem
sed -i s/"##NO-TOCAR-ESTA-LINEA".*/"##NO-TOCAR-ESTA-LINEA NoUSAR"/g /opt/opengnsys/tftpboot/menu.lst/templates/00PCVirtual
sed -i s/"##NO-TOCAR-ESTA-LINEA".*/"##NO-TOCAR-ESTA-LINEA NoUSAR"/g /opt/opengnsys/tftpboot/menu.lst/templates/18ogLiveEXPERIMENTAL
