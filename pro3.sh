#!/bin/bash
DIALOG_CANCEL=1
DIALOG_ESC=255
HEIGHT=0
WIDTH=0

display_result() {
  dialog --title "$1" \
    --no-collapse \
    --no-kill \
    --msgbox "$result" 0 0
}

while true; do
  exec 3>&1
  selection=$(dialog \
    --backtitle "System Utility App" \
    --title "Menu" \
    --clear \
    --cancel-label "Exit" \
    --menu "Please select:" $HEIGHT $WIDTH 4 \
    "1" "Configure the proxy Around the system in ubuntu" \
    "2" "Configure the proxy using the user ID and Password in ubuntu " \
    "3" "Configure the proxy Around the system in CentOs" \
    "4" "Configure the proxy using the user ID and Password in CentOs " \
    "5" "What's the tym !!!!!" \
    "6" " Calculator!!!" \
    "7" "CPU Load " \
    "8" "Speaking Cat" \
    2>&1 1>&3)
  exit_status=$?
  exec 3>&-
  case $exit_status in
    $DIALOG_CANCEL)
      clear
      echo "Program terminated."
      kdialog --title "Utility App" --passivepopup \
         "Thanku!!! See you Soon" 2
      exit
      ;;
    $DIALOG_ESC)
      clear
      echo "Program aborted." >&2
      exit 1
      ;;
  esac
  case $selection in
    0 )
      clear
      echo "Program terminated."
      ;;
    1 )
        bash proxycon.sh;
      ;;
    2 )
      bash proxycon1.sh;
      ;;
    3 )
     bash cent.sh
      ;;
     4 )
     bash cent1.sh  
     ;;
     5 )
        xclock ;
        chmod +x new.py;python ./new.py
        ;;
     6 ) 
     xcalc;
     ;;
     7 )
     xload;
     ;;
  esac
done

