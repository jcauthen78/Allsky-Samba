# Allsky-Samba
A simple shell script to install SAMBA & configure shares on the Raspberry Pi.

The intent is to create a network accessible folder to the main folder of my AllSky (https://github.com/AllskyTeam/allsky) via my MacOS laptop. The shares are accessible via Windows as well.

The code should be fairly intuitive, and it has been tested on Raspberry Zero 2W, RPI3 and RPI4's.

Use at your own risk - while I have successfully tested this on my many personal Raspberry PI systems, I am not a professional coder and I can't foresee every potential problem that may occur. There may be easier ways to accomplish what this script does, but this is what works for me and is something I run on every fresh Raspbian install without any hesitation.

Instructions: 
- Create new .sh file (example through command line): `nano smb_install.sh`
- Copy & paste (and edit if needed) the provided code
- Save file: `ctrl-x`
- Make the file executable: `chmod +x smb_install.sh`
- Run file:  `./smb_install.sh`
- - script will run, and eventually pause to have you set the SMB password (can be same as you use for your  `pi` user (suggested)).
- Once it is finished, check your local network devices in your Finder window (MacOS), or your File Explorer (Windows) window
