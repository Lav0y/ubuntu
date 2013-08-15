#!/bin/bash
#######################################################
# Version: 01b                                        #
#######################################################

# Update package lists and Install packages
apt-get update
apt-get dist-upgrade -y
apt-get autoremove

PS3='...Reboot Now?: '
options=("Y)" "N)")
select opt in "${options[@]}"
do
case $opt in
	"Y")
		reboot now
break
;;
	"N")
		echo "...I recommend to reboot after an update!"
break
;;
        *) echo invalid option;;
esac
done
