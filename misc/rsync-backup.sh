#!/bin/bash
#######################################################
# Version: 01a #
#######################################################

# Source and Destination directories
src="/home/treyh"
dst="/media/treyh/Data1"

# If statements to confirm the directories are correct
## I put a blank .txt in each directory to ensure that I never swapped them or chose the wrong directory...call me paranoid
if [ -f $src/Documents/docs.txt ]
        then
                echo "...SRC confirmed" & echo
        else
                echo "...SRC not confirmed, GoodBye!" && exit 0
fi
if [ -f $dst/data1.txt ]
        then
                echo "...DST confirmed"
        else
                echo "...DST not confirmed, GoodBye!" && exit 0
fi

# Rsync
echo "...Starting Backup"
rsync -zav $src/Documents/ $dst/Trey/Backups/Documents/ #--delete | tee backup.log
echo "...Backup Complete!"
