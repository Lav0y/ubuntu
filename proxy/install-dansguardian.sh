#!/bin/bash
#######################################################
# Version: 01a                                        #
# http://hydruid-blog.com/?cat=4                      #
#######################################################

# Install the dansguardian package
apt-get update 
apt-get install dansguardian

# Adjust the default config
cp /etc/dansguardian/dansguardian.conf /etc/dansguardian/dansguardian.conf.orig
sed -i 's:UNCONFIGURED - Please remove this line after configuration::g' /etc/dansguardian/dansguardian.conf

# Restart the dansguardian service
service dansguardian stop
service dansguardian start

# End of Script Message
FINDIP=`ifconfig | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1}'`
echo && echo "The dansguardian install script is complete!!!" && echo
echo "Configure your browser to use $FINDIP:8080 to begin using your new content filter." && echo
echo "...BTW make sure that you install squid3, as dansguardian requires a proxy to work!"

exit 0
