#!/bin/bash
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Instalace Raspberry Pi
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
COLOR_DEFAULT="\e[39m"
COLOR_CYAN="\e[36m"
COLOR_LIGHTBLUE="\e[1;34m"
COLOR_YELLOW="\e[33m"
COLOR_GREEN="\e[0;32m"
COLOR_RED="\e[31m"
COLOR_DARKRED="\e[1;31m"
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# FUNCTIONS
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
function hlavicka() {
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
    echo -e ${COLOR_YELLOW}"${1}"${COLOR_DEFAULT}
}
function display_info_n() {
    echo -e -n ${COLOR_YELLOW}"${1}"${COLOR_DEFAULT}
}
function display_title() {
    echo -e ${COLOR_CYAN}"${1}"${COLOR_DEFAULT}
}

function display_error() {
    echo -e ${COLOR_RED}"${1}"${COLOR_DEFAULT} 1>&2
}
function pokracovat(){
  display_info_n "Pokračovat? (y/n) "
  read prompt
  if [ "$prompt" = "n" ]; then
    exit
  fi
} 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
if [ "$(whoami)" != "root" ]; then
  display_error "***Spusťte skript jako ROOT prosím. (sudo !!)***"
  exit
fi
