#!/bin/bash
# Basic install script for SAMBA, to enable network access from a MAC.
# Echo's & Colors can be eliminated - used for testing clarity.
Color_Off='\033[0m'       # Text Reset
Green='\033[0;32m'        # Green
echo -e "..... Installing ${Green}Samba${Color_Off}"
sudo apt install samba -y
echo -e "..... Setting Password for ${Green}Pi${Color_Off}"
sudo smbpasswd -a pi
sudo mv /etc/samba/smb.conf /etc/samba/smb.bak
echo -e "..... Seting Up ${Green}/etc/samba/smb.conf${Color_Off}"
{
     echo "### Config File ###"
     echo "[global]"
     echo "client min protocol = SMB2"
     echo "client max protocol = SMB3"
     echo "vfs objects = catia fruit streams_xattr"
     echo "fruit:metadata = stream"
     echo "fruit:model = RackMac"
     echo "fruit:posix_rename = yes"
     echo "fruit:veto_appledouble = no"
     echo "fruit:wipe_intentionally_left_blank_rfork = yes"
     echo "fruit:delete_empty_adfiles = yes"
     echo "security = user"
     echo "encrypt passwords = yes"
     echo "workgroup = WORKGROUP"
     echo "server role = standalone server"
     echo "obey pam restrictions = no"
     echo "map to guest = never"
     echo "[Allsky-Rover]"
     echo "comment = AllSky Rover Home"
     echo "browseable = yes"
     echo "path = /home/pi"
     echo "read only = no"
     echo "create mask = 0775"
     echo "directory mask = 0775"
     echo "[Allsky-Rover]"
     echo "comment = AllSky Rover Root"
     echo "browseable = yes"
     echo "path = "
     echo "read only = no"
     echo "create mask = 0775"
     echo "directory mask = 0775"
     echo "### end Config ###"
} | sudo tee /etc/samba/smb.conf
echo -e "..... Restarting ${Green}SAMBA${Color_Off}"
sudo /etc/init.d/smbd restart
