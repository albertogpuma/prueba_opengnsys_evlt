#!/bin/bash
#/**
#@file    loadenvironEVLT.sh
#@brief   Script de carga de la API de funciones de OpenGNSys.
#@warning License: GNU GPLv3+
#@version 0.9
#@author  
#@date    
#@version 
#@author  
#@date    
#*/

# Exportamos la zona horaria
TZ='Europe/Madrid'; export TZ

# hora.alumnos.uma.es # 150.214.54.200 #  #cronos.uma.es 50.214.41.238
ntpdate 150.214.54.200

touch /etc/profile.d/loadenvironEVLT.sh
chmod 777 /etc/profile.d/loadenvironEVLT.sh


# configuraci�n DNS y Proxy.
mkdir -p /run/resolvconf/
touch /run/resolvconf/resolv.conf
echo "nameserver 150.214.54.200" > /etc/resolv.conf
echo "nameserver 150.214.57.8" > /etc/resolv.conf
echo "nameserver 150.214.40.11" > /etc/resolv.conf
echo "nameserver 150.214.40.12" > /etc/resolv.conf

echo 'http_proxy=http://proxy.alumnos.uma.es:3128/' >> /etc/environment
echo 'https_proxy=https://proxy.alumnos.uma.es:3128/' >> /etc/environment
echo 'ftp_proxy=ftp://proxy.alumnos.uma.es:3128/' >> /etc/environment

echo 'APT::Install-Recommends "0";' >> /etc/apt/apt.conf
echo 'APT::Install-Suggests "0";' >> /etc/apt/apt.conf
echo 'Acquire::PDiffs "false";' >> /etc/apt/apt.conf
echo 'Acquire::http::proxy "http://proxy.alumnos.uma.es:3128/";' >> /etc/apt/apt.conf
echo 'Acquire::https::proxy "https://proxy.alumnos.uma.es:3128/";' >> /etc/apt/apt.conf
echo 'Acquire::ftp::proxy "ftp://proxy.alumnos.uma.es:3128/";' >> /etc/apt/apt.conf


