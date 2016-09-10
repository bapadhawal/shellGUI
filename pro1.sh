#!/bin/bash
tput clear
tput sgr0
 find -name "*~"  > data.txt 
 bash new.sh
pass=$(kdialog --password "Please enter the password to continue:")
    if [ $? = 0 ]; then
                if [ "$pass" == "dhawal11" ]
                then 
                kdialog --msgbox "Password correct.\n About to connect"
                        if [ $? = 0 ]
                        then
choice=$(kdialog --checklist "file management system" 1 "Display all the temporary 
file" off  3 "delete all the files" off  )
	if [ $(expr length "$choice") != 0 ]; then
		for result in $choice
			do
				if [ $result = '"1"' ]; then
					kdialog --textbox data.txt 512 256
				fi;
				if [ $result = '"3"' ]; then
				find . -type  -name "*~" -exec rm -f {} \;
                                kdialog --msgbox "all files deleted\n"
				fi;
			done;
	else
		kdialog --sorry "NO SELECTION WAS MADE";
	fi;
                        fi          
                else 
              kdialog --sorry "Password incorrect.\n Will not connect to server"
                fi
    else
           kdialog --msgbox "Please re-enter the password\n"
    fi
     else 
    kdialog --title "Disk Cleaning APP" --passivepopup "Thanku for using us!!!!!" 2
fi
