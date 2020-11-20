#!/bin/bash
Menu(){
# -t : untuk title
# -m : untuk manual
local OPTIND 
local mnl=0
local slct

	while getopts ":t:m:" opt
	do
		case $opt in
		t) echo -e "\n[== $OPTARG ==]";;
		m) mnl=1
		slct=$OPTARG;; 
		esac
    done
	shift $((OPTIND -1))
	
local arg=("$@")
local carg=${#arg[@]} 
	
	for ((i=0;i<$carg;i++))
	do 	
		echo -e "$(expr $i + 1)) ${arg[$i]}"
	done
	
	if [ $mnl -eq 1 ]
       	then
		echo "$(expr $i + 1)) $slct"
	fi
	
	read -p "select : " MSEL
}
InputManul(){
	echo -e "\n[ $1 ]"
	read -p "Input : " $2
#InputManul "judul input" namavariable (jangan lupa parameter yg di pash harus di apit ole kutip dua)
#hasil akan di tampung di variable,sebaiknya variable penampung nya global
}
ErrorSalact(){
	echo -e "$R\nwrong select....\n$NC"
}
ListNet(){

	echo "$(ip -4 addr | grep : | cut -d : -f2 | tr -d " ")"
#hasilnya akan berbentuk list vertikal dari interface net
}
GetIp(){
	echo $(ip addr show $1 | grep -E -o "[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}/" | tr -d "/")
#GetIp nama_interface 
}
CountLine(){
	echo "$1"  | wc -l
#CountLine $list
#hasilnua jumlah dari list, inputnya harus berberntuk list
}
SelectLine(){
	echo "$1" | sed -n $2'p'
#SelectLine $list pilihbaris
#memilih baris dari list
}
CheckRoot(){
	#check user root atau bukan, statusnya akan di tammpung di variable SROOT
	#1 = root
	#0 = nonroot
if [ $EUID -eq 0 ]
	then
		SROOT=1
	else
		SROOT=0
fi
}