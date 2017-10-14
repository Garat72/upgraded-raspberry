#!/bin/bash
set -e
source  $PWD/upgraded-raspberry/include_function.sh

function pokracovat() {
  display_info_n "       $1 [Y/n]:"
  read prompt
  case $prompt in
    Y|y) test=y;;
    N|n) test=n;;
    *)  display_error "       Zadejte Y nebo n" && pokracovat ;;
  esac
}
logo
cd $BACK && pwd
display_info "###########################################################################################"
display_error "$HOME"

display_error "$PWD"
source "${1:h}/z.sh"