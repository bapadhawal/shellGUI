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
    --backtitle "System Information" \
    --title "Menu" \
    --clear \
    --cancel-label "Exit" \
    --menu "Please select:" $HEIGHT $WIDTH 4 \
    "1" "Display System Information" \
    "2" "Display Disk Space" \
    "3" "Display Home Space Utilization" \
    "4" "Display the process which takes more than 5 mins" \
    "5" "Delete the process running from more than one day" \
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
      result=$(echo "Hostname: $HOSTNAME"; uptime)
      display_result "System Information"; chmod +x new.py;python ./new.py 
      ;;
    2 )
      result=$(df -h)
      display_result "Disk Space";
      ;;
    3 )
      if [[ $(id -u) -eq 0 ]]; then
        result=$(du -sh /bapa/home/* 2> /dev/null)
        display_result "Home Space Utilization (All Users)"
      else
        result=$(du -sh $HOME 2> /dev/null)
        display_result "Home Space Utilization ($USER)"
      fi
      ;;
     4 )
     result=$(ps -fo pid,etime | grep '[0-2][0-9]:[0-5][5-9]:[0-5][0-9]')
     display_result "Display the process which takes more than 5 mins"  
     ;;
     5 ) 
     ps -fo pid,etime | grep '[1-10]-[0-2][0-4]:[0-5][0-9]:[0-5][0-9]' > pid.txt
     cut -c1-5 pid.txt > pid1.txt
     cat pid1.txt | while read LINE
     do
      kill -9 $LINE
      done
      result="All the process deleted !!!!"
      display_result "Delete the process running from more than one day" "result";
       chmod +x new1.py;
       python ./new1.py  
     ;;
  esac
done

