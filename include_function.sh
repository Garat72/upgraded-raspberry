#!/bin/bash
#############################################################################################
#  include_function.sh
#############################################################################################
COLOR_DEFAULT="\e[39m"
COLOR_CYAN="\e[36m"
COLOR_LIGHTBLUE="\e[1;34m"
COLOR_YELLOW="\e[33m"
COLOR_GREEN="\e[0;32m"
COLOR_RED="\e[31m"
COLOR_DARKRED="\e[1;31m"
#############################################################################################
BACK="/home/pi"
LOCAL_IP=$(hostname -I | awk '{ print $1}')
PASSWORD='password'
#############################################################################################
# FUNCTIONS                                                                                 #
#############################################################################################
function logo() {
  clear
  echo -e "${COLOR_LIGHTBLUE}"
  echo -e ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
  echo -e "                                                                                           "
  echo -e " :::::::::  :::::::::   ::::::::  :::       ::::::::: :::    ::: :::::::::     ::::   :::: "
  echo -e " :+:    :+: :+:    :+: :+:    :+: +:+       :+:       :+:    :+:    :+:         +:+: :+:+  "
  echo -e " +:+    +:+ +:+    +:+ +:+    +:+ +:+       :+:       +:+    +:+    :+:           +:+:+    "
  echo -e " +#+#+#+#:  +#+#+#+#:  +#+    +#+ +#+       +#+#+#    +#+#+#+#:     +#+    +#+     +#+     "
  echo -e " +#+        +#+    +#+ +#+    +#+ +#+   +#+ +#+       +#+    +#+    +#+           #+#+#    "
  echo -e " #+#        #+#    #+# #+#    #+# #+#   #+# #+#       #+#    #+#    #+#         +#+# #+#+  "
  echo -e " ###        ###    ###  ########   #######  ######### ###    ###    ###        ####   #### "
  echo -e "                                                                                           "
  echo -e "###########################################################################################"
  echo -e "################################### Test Raspberry Pi #####################################"
  echo -e "###########################################################################################"
  echo -e "${COLOR_DEFAULT}"
}
function display_info() {
    echo -e ${COLOR_GREEN}"${1}"${COLOR_DEFAULT}
}
function display_info_n() {
    echo -e -n ${COLOR_DARKRED}"${1}"${COLOR_DEFAULT}
}
function display_title() {
    echo -e ${COLOR_CYAN}"${1}"${COLOR_DEFAULT}
}

function display_error() {
    echo -e ${COLOR_RED}"${1}"${COLOR_DEFAULT} 1>&2
}
#############################################################################################
function pokracovat() {
  display_info_n "       Pokračovat? [Y/n]:"
  read prompt
  case $prompt in
    Y|y) ;;
    N|n) exit ;;
    *)  display_error "       Zadejte Y nebo n" && pokracovat ;;
  esac
}
function restart(){
  display_info_n "       Restartovat? [Y/n]:"
  read prompt
  case $prompt in
    Y|y) reboot;;
    N|n) ;;
    *)   display_error "       Zadejte Y nebo n" && restart ;;
  esac
}
function kontrola_root() {
  if [ "$(whoami)" != "root" ]; then
    display_error "***Spusťte skript jako ROOT prosím. (sudo !!)***"
    exit
  fi
}
#############################################################################################
function run_info() {
  uname -a
  timedatectl
  locale
  ifconfig | grep "inet"
  pokracovat
}
#############################################################################################