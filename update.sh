#!/bin/bash
#######################################################
# Version: 01a                                        #
#######################################################

# Update package lists and Install packages
apt-get update
apt-get dist-upgrade -y

# Update package lists and Install packages silently
#apt-get update 2>&1 /dev/null
#apt-get dist-upgrade -y 2>&1 /dev/null
