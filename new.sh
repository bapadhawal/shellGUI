#!/bin/bash
tput clear
tput sgr0
 find -name "*~"  > data.txt 
res=$(kdialog --menu "Welcome to Your Disk Cleaning APP" a "login" b "register")
       case $res in 
       a)  
        touch logfile.txt
       user=$( kdialog --title "Authentication Required " --inputbox "Please Enter The User Name" "root")
        cat /etc/passwd | cut -d: -f1 > logfile.txt
        name=$(grep $user logfile.txt)  
        if [ "$name" == "$user" ];then         
       pass=$(kdialog --password "Please enter the password to continue:")
   if  [ $? = 0 ]; then
                if [ "$pass" == "dhawalpatel" ]
                then 
                kdialog --msgbox "Password correct.\n About to connect"
                        if [ $? = 0 ]
                        then
choice=$(kdialog --checklist "file management system" 1 "Display all the temporary file" 2 "delete all the files" 3 "Display the access details" )
	if [ $(expr length "$choice") != 0 ]; then
		for result in $choice
			do
				if [ $result = '"1"' ]; then
					kdialog --textbox data.txt 512 256
				fi;
				if [ $result = '"2"' ]
				then
	kdialog --combobox "Select the file to delete:" 
	                        
				fi
				if [ $result = '"2"' ]; then
				find . -type  -name "*~" -exec rm -i {} \;
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
      ;;
      b) 
      echo "dhawal "
                ;;
     esac 
