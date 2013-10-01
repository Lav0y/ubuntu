#!/bin/bash
#######################################################
# Version: 01a                                        #
# http://hydruid-blog.com/?cat=4                      #
#######################################################

# Install the squid3 package
apt-get update 
apt-get install squid3

# Download squid3 config
wget -N https://raw.github.com/hydruid/ubuntu/master/proxy/squid.conf.example01 -P /etc/squid3
mv /etc/squid3/squid.conf /etc/squid3/squid.conf.orig
cp /etc/squid3/squid.conf.example01 /etc/squid3/squid.conf

# Restart the squid3 service
service squid3 stop
service squid3 start

# End of Script Message
FINDIP=`ifconfig | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1}'`
echo && echo "The squid3 install script is complete!!!" && echo
echo "Configure your browser to use $FINDIP:3128 to begin using your new proxy."

exit 0
