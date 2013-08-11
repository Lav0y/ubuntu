#!/bin/bash
#######################################################
# Version: 01a                                        #
#######################################################

mysql -u root -p mysql -e "FLUSH PRIVILEGES;"
mysql -u root -p mysql -e "SET PASSWORD FOR root@'localhost' = PASSWORD('');"
mysql -u root -p mysql -e "UPDATE mysql.user SET Password=PASSWORD('') WHERE User='root';"

echo "The password for the root MySQL user is now blank!"
exit 0
