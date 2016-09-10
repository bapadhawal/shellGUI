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

if which dialog > /dev/null
then
    dialog --backtitle ""\
    --title "(-:This is my world :-)"\
    --infobox "\n$mess\nThis is $dat" 6 60
 
  #clear
else
    echo -e "$mess\nThis is $dat"
fi

