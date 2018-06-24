#!/bin/bash
# Programa hecho por Marcelo Vázquez (aka s4vitar)
# No me hago responsable del mal uso que se pueda hacer de este programa, pues pretende ser educativo, no malicioso.

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

logoSpawn()
{
	echo -e "${yellowColour}╭━━━╮╱╱╱╱╱╱╱╱╭╮╱╱╱╭╮╭╮╭┳━━━╮" && sleep 0.03
	echo -e "┃╭━╮┃╱╱╱╱╱╱╱╭╯╰╮╱╱┃┃┃┃┃┃╭━╮┃" && sleep 0.03
	echo -e "┃╰━╯┣━━┳╮╭┳━┻╮╭╋━━┫┃┃┃┃┃┃╱┃┃ (${endColour}${grayColour}Hecho por ${greenColour}Marcelo Vázquez$endColour$grayColour aka${endColour}${redColour} s4vitar${endColour}$yellowColour)" && sleep 0.03
	echo -e "┃╭╮╭┫┃━┫╰╯┃╭╮┃┃┃┃━┫╰╯╰╯┃╰━╯┃" && sleep 0.03
	echo -e "┃┃┃╰┫┃━┫┃┃┃╰╯┃╰┫┃━╋╮╭╮╭┫╭━╮┃" && sleep 0.03
	echo -e "╰╯╰━┻━━┻┻┻┻━━┻━┻━━╯╰╯╰╯╰╯╱╰╯${endColour}" & sleep 0.4
}

if [ "$(id -u)" -eq "0" ]; then
	tput civis && clear
	logoSpawn
else
	echo -e "${redColour}Es necesario correr el programa como root${endColour}"
fi
