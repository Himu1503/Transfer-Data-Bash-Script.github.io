#!/bin/bash
#This script will help you to delete the files which are older than 3 days on the receving server
#You can do a Cron Job to automate this process.
#Modify this script accordingly to your requirement 
parent_dir="Set the Directory name same as you set in the transfer script"

if [ ! -d $x ] ; then
        echo "Dir non-existent"

else
        cd $parent_dir

        
        if [ -d ]; then

                
                for dir in */; do
                        if [ -d "$dir" ]; then
                                cd "$dir"
                                ls -tp | grep 20 | tail -n +4 | xargs -0 rm -r 

                        fi

                done
        fi
fi
