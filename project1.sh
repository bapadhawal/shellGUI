tput clear
temph=`date | cut -c12-13`
dat=`date +"%A %d in %B of %Y (%r)"`

if [ $temph -lt 12 ]
then
    mess="Good Morning $LOGNAME, Have nice day!"
fi

if [ $temph -gt 12 -a $temph -le 16 ]
then
    mess="Good Afternoon $LOGNAME"
fi

if [ $temph -gt 16 -a $temph -le 18 ]
then
    mess="Good Evening $LOGNAME"
fi
# Move cursor to screen location X,Y (top left is 0,0)
tput cup 3 15
 
# Set a foreground colour using ANSI escape
#tput setab 4
if which dialog > /dev/null
then
    dialog --backtitle ""\
    --title "(-:welcome to my world:-)"\
    --infobox "\n$mess\nThis is $dat"  6 60
else
    echo -e "$mess\nThis is $dat"
fi
tput sgr0
 
tput cup 15 17
echo "M A I N - M E N U"
tput sgr0
tput setab 4
read
tput clear

