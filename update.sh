#!/bin/bash
#######################################################
# Version: 01b                                        #
#######################################################

# Update package lists and Install packages
apt-get update
apt-get dist-upgrade -y
apt-get autoremove

echo && echo "Reboot Now?"
PS3='(Press 1 or 2): '
options=("Yes" "No")
select opt in "${options[@]}"
do
case $opt in
	"Yes")
		echo "do reboot" #	reboot now
break
;;
	"No")
		echo "...I recommend to reboot after an update!"
break
;;
        *) echo invalid option;;
esac
done
