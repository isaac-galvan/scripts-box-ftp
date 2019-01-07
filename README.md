# Box FTP scripts

These scripts use the `lftp` command to copy files and folders to Box.  Encryption is forced for authentication and file transfer.

The upload script overwrites files in the destination. The mirror script only transfer changed or new files.

For more information on using FTP with Box, see [Box Community: Using Box with FTP or FTPS](https://community.box.com/t5/Upload-and-Download-Files-and/Using-Box-with-FTP-or-FTPS/ta-p/26050)

## Configuration

FTP connections to Box require creating a separate "external password" if your Box environment is configured for single sign-on.

[Box: Working with External Passwords](https://community.box.com/t5/How-to-Guides-for-Account/Box-SSO-Working-with-External-Passwords/ta-p/52034)

Create a `.settings` file with the format:

``` bash
#!/bin/bash
ftp_server="ftp.box.com"

# Box account email address
ftp_user="login@example.com"
# Box account external password
ftp_pass="external_password"

# Base directory for all transfers
ftp_path="temp"
# Upload directory can be specified at run
ftp_dir=""
```
