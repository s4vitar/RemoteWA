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

menuSpawn()
{
	echo -e "${yellowColour}╭━━━╮╱╱╱╱╱╱╱╱╭╮╱╱╱╭╮╭╮╭┳━━━╮" && sleep 0.03
	echo -e "┃╭━╮┃╱╱╱╱╱╱╱╭╯╰╮╱╱┃┃┃┃┃┃╭━╮┃" && sleep 0.03
	echo -e "┃╰━╯┣━━┳╮╭┳━┻╮╭╋━━┫┃┃┃┃┃┃╱┃┃ (${endColour}${grayColour}Hecho por ${greenColour}Marcelo Vázquez$endColour$grayColour aka${endColour}${redColour} s4vitar${endColour}$yellowColour)" && sleep 0.03
	echo -e "┃╭╮╭┫┃━┫╰╯┃╭╮┃┃┃┃━┫╰╯╰╯┃╰━╯┃" && sleep 0.03
	echo -e "┃┃┃╰┫┃━┫┃┃┃╰╯┃╰┫┃━╋╮╭╮╭┫╭━╮┃" && sleep 0.03
	echo -e "╰╯╰━┻━━┻┻┻┻━━┻━┻━━╯╰╯╰╯╰╯╱╰╯${endColour}" & sleep 0.4
	echo -e "${greenColour}----------------------------${endColour}" && sleep 0.4
	echo -e "${yellowColour}1)${endColour} ${grayColour}Enviar código de registro${endColour}" && sleep 0.1
	echo -e "${yellowColour}2)${endColour} ${grayColour}Obtener sesión remota${endColour}" && sleep 0.1
	echo -e "${yellowColour}3)${endColour} ${grayColour}Enviar mensaje a destinatario${endColour}" && sleep 0.1
	echo -e "${yellowColour}4)${endColour} ${grayColour}Visualizar mensajes entrantes${endColour}" && sleep 0.1
	echo -e "${greenColour}-------------------------------------${endColour}" && sleep 0.4
	echo -ne "${blueColour}Selecciona una opción:${endColour}${greenColour} "
	read menu_option && echo -e "${endColour}"

}

sendCode()
{
	clear && echo -e "${yellowColour}Selecciona una operada [$endColour${redColour}La opción 4 funciona para todos los casos${endColour}${yellowColour}]:${endColour}"
	echo -e "$greenColour-------------------------------------------------------------------------------$endColour"
	echo -e "${redColour}1)${endColour}$blueColour  Operator: Vodafone Spain | Brand: Vodafone$endColour" && sleep 0.02
        echo -e "${redColour}2)$endColour$blueColour  Operator: France Telecom España SA | Brand: Orange$endColour" && sleep 0.02
        echo -e "${redColour}3)$endColour$blueColour  Operator: Xfera Moviles SA | Brand: Yoigo$endColour" && sleep 0.02
        echo -e "${redColour}4)$endColour$blueColour  Operator: Telefónica Móviles España | Brand: Movistar$endColour" && sleep 0.02
        echo -e "${redColour}5)$endColour$blueColour  Operator: Vodafone Spain | Brand: Vodafone$endColour" && sleep 0.02
        echo -e "${redColour}6)$endColour$blueColour  Operator: -- | Brand: Euskatel$endColour" && sleep 0.02
        echo -e "${redColour}7)$endColour$blueColour  Operator: France Telecom España SA | Brand: Orange$endColour" && sleep 0.02
        echo -e "${redColour}8)$endColour$blueColour  Operator: -- | Brand: Operadora de Telecomunicaciones Opera SL$endColour" && sleep 0.02
        echo -e "${redColour}9)$endColour$blueColour  Operator: France Telecom España SA | Brand: Orange$endColour" && sleep 0.02
        echo -e "${redColour}10)$endColour$blueColour Operator: BT Group España Comapía de Servicios | Brand: BT$endColour" && sleep 0.02
        echo -e "${redColour}11)$endColour$blueColour Operator: Telecable de Asturias S.A.U. | Brand: TeleCable$endColour" && sleep 0.02
        echo -e "${redColour}12)$endColour$blueColour Operator: Móbil R | Brand: R Cable y Telecomunicaciones Galicia S.A. SL$endColour" && sleep 0.02
        echo -e "${redColour}13)$endColour$blueColour Operator: Cableuropa S.A.U. | Brand: ONO$endColour" && sleep 0.02
        echo -e "${redColour}14)$endColour$blueColour Operator: Orange S.A. | Brand: Jazztel$endColour" && sleep 0.02
	echo -e "$greenColour-------------------------------------------------------------------------------$endColour"
	echo -ne "${yellowColour}Opción:${endColour}${greenColour} "
	read operator_option && echo -e "${endColour}"

	mcc=$(cat operators | grep "^$operator_option" | awk '{print $2}')
	mnc=$(cat operators | grep "^$operator_option" | awk '{print $3}')

	echo -ne "${yellowColour}Número de teléfono:${endColour}${blueColour} "
	read mobile_number && echo -e "${endColour}" && echo -e "${grayColour}Enviando SMS...${endColour}"
	
	yowsup-cli registration --requestcode sms --phone 34${mobile_number} --cc 34 --mcc $mcc --mnc $mnc -E android > /dev/null 2>&1 && clear
}

if [ "$(id -u)" -eq "0" ]; then
	tput civis && clear
	echo -e "${redColour}Aviso: ${endColour}${yellowColour}Para el correcto funcionamiento del programa es necesario tener${endColour}${blueColour} yowsup${endColour}${yellowColour} instalado${endColour}" && sleep 3 && clear
	
	while true; do
		menuSpawn

		case $menu_option in

			1) sendCode
			   ;;

			2) obtainSession
			   ;;

			3) sendMessage
			   ;;

			4) seeMessage
			   ;;
		esac
	done

else
	echo -e "${redColour}Es necesario correr el programa como root${endColour}"
fi
