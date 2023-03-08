#!/bin/bash
parent_dir="This is the directory where all your files will be stored on the remote server"
REMOTE_SERVER="Address of the remote server"
REMOTE_DIRECTORY="~/$parent_dir/$HOSTNAME/"
FILES=(
    #Path of the files that you want to transfer from the current server. 
)

if [ ! -d $parent_dir ]; then
    mkdir $parent_dir
    sudo scp -i cloudconformance.pem -r ./$parent_dir "$REMOTE_SERVER":~/

# Loop through the files and directories and transfer them to the remote server
   for FILE in "${FILES[@]}"
   do
     sudo scp -i cloudconformance.pem -r "$FILE" "$REMOTE_SERVER:$REMOTE_DIRECTORY"
   done

elif [ -d $parent_dir ]; then
  for FILE in "${FILES[@]}"
  do
    sudo rsync -azvv -e "ssh -i ./cloudconformance.pem" --checksum -r "$FILE" "$REMOTE_SERVER:$REMOTE_DIRECTORY"
  done

fi
