#!/bin/bash
# upload to box with lftp script
# usage: upload-box-lftp.sh <filename> [dest_folder]
# note: will overwrite any file that exists on remote(!)

# get password and variables from settings file
source .settings

# sanity check file exists
if [ ! -e "$1" ]; then
	echo "Error: file '$1' doesn't exist."
        echo "Usage: $0 <filename> [dest_folder]"
        exit
fi

# set the upload folder from args
if [ "$2" ]; then
    ftp_dir=$2
fi

echo "Attempting to upload '$1' to $ftp_path/$ftp_dir.."

# execute lftp with the appropriate options
lftp <<EOF
    set ftps:initial-prot ""
    set ftp:ssl-force true
    set ftp:ssl-protect-data true
    open $ftp_server
    user $ftp_user $ftp_pass
    mkdir $ftp_path/$ftp_dir
    cd $ftp_path/$ftp_dir
    put "$1"
    bye
EOF

echo "Done."