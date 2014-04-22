#!/bin/bash
##########################################
# Version: 01a
#  Status: Functional
#   Notes: n/a
#      OS: Ubuntu 12.x +
##########################################

# Beginning Script Message
clear
echo && echo "Welcome to the SNMPD install script!" && echo
echo "*WARNING*: This script will setup a very basic SNMP configuration." && echo 
echo "...Begin, we will, learn you must." && sleep 1

# Installer variables
COMMUNITY="public123"

# Update OS
apt-get update

# Install SNMPD
apt-get install snmpd snmp -y && echo

# Adjust config files
mv /etc/snmp/snmpd.conf /etc/snmp/snmpd.conf.orig
cat > /etc/snmp/snmpd.conf << EOL
rocommunity $COMMUNITY 
syslocation "Your Location"
syscontact admin@domain.com
EOL
sed -i "s|SNMPDOPTS='-Lsd -Lf /dev/null -u snmp -g snmp -I -smux -p /var/run/snmpd.pid'|SNMPDOPTS='-Lsd -Lf /dev/null -u snmp -I -smux -p /var/run/snmpd.pid -c /etc/snmp/snmpd.conf'|g" /etc/default/snmpd

# Restart SNMPD and do a test snmpwalk
service snmpd restart
snmpwalk -v1 -c$COMMUNITY localhost system

# End Script Message
echo && echo "You now have SNMPD setup with a basic configuration!"
exit 0


