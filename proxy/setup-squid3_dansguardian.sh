#!/bin/bash
#######################################################
# Version: 01b                                        #
# http://hydruid-blog.com/?cat=4                      #
#######################################################

# Start of script message
clear
echo "This script will install squid3 and dansguardian with the most basic configurations"

# Install the packages
apt-get update 
apt-get install squid3 dansguardian

# Basic Configurations 
wget -N https://raw.github.com/hydruid/ubuntu/master/proxy/squid.conf.example01 -P /etc/squid3/
mv /etc/squid3/squid.conf /etc/squid3/squid.conf.orig
cp /etc/squid3/squid.conf.example01 /etc/squid3/squid.conf
cp /etc/dansguardian/dansguardian.conf /etc/dansguardian/dansguardian.conf.orig
sed -i 's:UNCONFIGURED - Please remove this line after configuration::g' /etc/dansguardian/dansguardian.conf

# Restart the services
service squid3 stop
service squid3 start
service dansguardian stop
service dansguardian start

# End of Script Message
FINDIP=`ifconfig | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1}'`
echo && echo "The dansguardian install script is complete!!!" && echo
echo "Configure your browser to use $FINDIP:8080 to begin using your new content filter." && echo

exit 0
