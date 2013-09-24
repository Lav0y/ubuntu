#!/bin/bash
#######################################################
# Version: 01b                                        #
# http://hydruid-blog.com/?cat=4                      #
#######################################################

clear
echo && echo "Does your MySQL admin account use a password?"
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

echo "Enter the MySQL user, that you would like to reset the password for"
read -p "...username: " username2

if [ -z "$password" ]
then
        mysql -u$username -e "FLUSH PRIVILEGES;"
        mysql -u$username -e "SET PASSWORD FOR $username2@'localhost' = PASSWORD('');"
        mysql -u$username -e "UPDATE mysql.user SET Password=PASSWORD('') WHERE User='$username2';"
else
	mysql -u$username -p$password -e "FLUSH PRIVILEGES;"
	mysql -u$username -p$password -e "SET PASSWORD FOR $username2@'localhost' = PASSWORD('');"
	mysql -u$username -p$password -e "UPDATE mysql.user SET Password=PASSWORD('') WHERE User='$username2';"
fi

echo "The password for the MySQL user $username2 is now blank!"
