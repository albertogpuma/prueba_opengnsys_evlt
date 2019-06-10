#!/bin/bash
scp root@172.17.10.242:/opt/repoapp/opengnsys/server/tecnico/id* /home/tecnico/.ssh/
scp root@172.17.10.242:/opt/repoapp/opengnsys/server/tecnico/authorized_keys2 /home/tecnico/.ssh/
cp /home/tecnico/.ssh/id* /root/.ssh
cp /home/tecnico/.ssh/authorized_keys2 /root/.ssh/
cp /home/tecnico/.ssh/id* /home/administrador/.ssh
cp /home/tecnico/.ssh/authorized_keys2 /home/administrador/.ssh/

chmod 600 /home/tecnico/.ssh/id_rsa
chmod 600 /home/tecnico/.ssh/id_rsa
chmod 644 /root/.ssh/id_rsa.pub
chmod 644 /root/.ssh/id_rsa.pub
chmod 644 /home/administrador/.ssh/id_rsa.pub
chmod 644 /home/administrador/.ssh/id_rsa.pub

exit

