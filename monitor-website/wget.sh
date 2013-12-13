#!/bin/bash
#######################################################
# Version: 01a                                        #
#  Status: Functional                                 #
#   Notes: Works until cookie expires                 #
#######################################################

# Script Variables
## File Names
original="original.html"
current="current.html"
## Website URL
website="http://hydruid-blog.com/?p=618"

# Remove current file to ensure data is fresh
rm $current

# Fetch website using cookie
wget --cookies=on --load-cookies=cookies.txt --keep-session-cookies $website -O $current

# Compare the original and current 
if cmp -s $current $original; then
    echo "...No change detected."
else
    echo "...Change detected, generate alert!"
fi

exit 0
