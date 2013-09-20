#!/bin/bash
#######################################################
# Version: 01a Alpha - 01                             #
#   Notes: Not functional                             #
#######################################################

apt-get install dchroot debootstrap

mkdir -p /var/chroot/precise

#echo info into
#/etc/schroot/schroot.conf
#[precise]
#description=Ubuntu 12.04 LTS
#directory=/var/chroot/precise
#users=treyh
#groups=treyh
#root-groups=root
