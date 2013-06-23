#################################
# update.sh
# Version: 01
# http://hydruid-blog.com/?cat=4
#
# Quick script to keep your server/desktop updated

# Update package lists
apt-get update

# Install updated packages and dependencies
apt-get dist-upgrade -y
