#!/bin/bash
#######################################################
# Version: 01b                                        #
# http://hydruid-blog.com/?cat=4                      #
#######################################################

clear && echo && echo "Does your MySQL admin account use a password?"
PS3='(Press 1 or 2): '
options=("Yes" "No")
select opt in "${options[@]}"
do
case $opt in
        "Yes")
		echo "Enter your MySQL admin credentials"
		read -p "...username: " username
		read -p "...password: " password
		echo & echo "Testing MySQL Connection..."
		mysql -u$username -p$password -e "show databases;" > /tmp/mysql.txt 2>> /tmp/mysql.txt
		if grep -Fxq "Database" /tmp/mysql.txt
			then echo "...MySQL connection test successful."
			else echo "...Mysql connection failed." && exit 0
		fi
break
;;
        "No")
		echo "Enter your MySQL admin credentials"
		read -p "...username: " username
                mysql -u$username -e "show databases;" > /tmp/mysql.txt 2>> /tmp/mysql.txt
                if grep -Fxq "Database" /tmp/mysql.txt
                        then echo "...MySQL connection test successful."
                        else echo "...Mysql connection failed." && exit 0
		fi
break
;;
        *) echo invalid option;;
esac
done

echo "Enter the credentials for the MySQL user, that you would like to create"
read -p "...username: " username2
read -p "...password: " password2

if [ -z "$password" ]
then
	mysql -u$username -e "CREATE USER $username2@'localhost' IDENTIFIED BY  '$password2';"
else
	mysql -u$username -p$password -e "CREATE USER $username2@'localhost' IDENTIFIED BY  '$password2';"
fi

echo "The MySQL user $username has been created!"
