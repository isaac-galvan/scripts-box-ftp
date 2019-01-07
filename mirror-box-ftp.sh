#!/bin/bash
# mirror to box with lftp script
# usage: mirror-box-lftp <local_dir> [remote_dir]

# get password and variables from settings file
source .settings

# sanity check directory exists
if [ ! -d "$1" ]; then
	echo "Error: directory '$1' doesn't exist."
        echo "Usage: $0 <local_dir> [remote_dir/]"
        exit
fi

# set upload folder from args
if [ "$2" ]; then
    ftp_dir=$2
fi

echo "Attempting to mirror '$1' to $ftp_path/$ftp_dir.."

# execute lftp with the appropriate options
lftp <<EOF
    set ftps:initial-prot ""
    set ftp:ssl-force true
    set ftp:ssl-protect-data true
    open $ftp_server
    user $ftp_user $ftp_pass
    mkdir $ftp_path/$ftp_dir
    mirror -R "$1" $ftp_path/$ftp_dir -v
    bye
EOF

echo "Done."