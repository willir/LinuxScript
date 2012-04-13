#!/bin/bash

echo "Y" | apt-get update;
echo "Y" | apt-get upgrade;

echo "Y" | apt-get remove pitivi #del pitivi for change video
echo "Y" | apt-get remove empathy empathy-common nautilus-sendto-empathy #The client of instant messages
echo "Y" | apt-get remove gwibber gwibber-service #The client of microblogs
echo "Y" | apt-get remove vino #for show destop.
echo "Y" | apt-get remove computer-janitor-gtk # for system clearing.
echo "Y" | apt-get remove rhythmbox totem totem-common #default video and audio players.
echo "Y" | apt-get remove banshee # banshee.
echo "Y" | dpkg -r transmission-common transmission-gtk # remode default bit-torrent client.
echo "Y" | apt-get install --allow-unauthenticated kate wine cmake gedit gparted
echo "Y" | apt-get install --allow-unauthenticated libmono-winforms2.0-cil # install winform for mono

# browsers
echo "Y" | apt-get install --allow-unauthenticated chromium-browser 

echo "Y" | add-apt-repository "deb http://deb.opera.com/opera/ stable non-free"
wget -O - http://deb.opera.com/archive.key | apt-key add -
echo "Y" | apt-get update
echo "Y" | apt-get install --allow-unauthenticated opera
# /browsers

echo "Archivers and curl"
echo "Y" | apt-get install --allow-unauthenticated alien dpkg-dev debhelper build-essential p7zip p7zip-full unace arj 
echo "Y" | apt-get install --allow-unauthenticated lha cpio curl zip rar unrar

echo "goldendict pidgin git"
echo "Y" | apt-get install --allow-unauthenticated goldendict pidgin

echo "install deadbeef - audio player."
echo "Y" | add-apt-repository ppa:alexey-smirnov/deadbeef
echo "Y" | apt-get update
echo "Y" | apt-get install --allow-unauthenticated deadbeef

echo "Y" | apt-get install --allow-unauthenticated ubuntu-restricted-extras # Codecs
echo "Y" | apt-get install --allow-unauthenticated vlc mozilla-plugin-vlc # video player.

echo "Y" | apt-get install --allow-unauthenticated ktorrent

echo "Y" | apt-get install --allow-unauthenticated krusader

# install java 5
#echo "Y" | add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ hardy main multiverse"
#echo "Y" | add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ hardy-updates main multiverse"
#echo "Y" | apt-get update
#echo "Y" | apt-get install sun-java5-jdk
# /install java 5

echo "Y" | apt-get install --allow-unauthenticated openjdk-6-jdk
echo "Y" | apt-get install --allow-unauthenticated git-core gnupg flex bison gperf libsdl-dev libesd0-dev ssh gitk
echo "Y" | apt-get install --allow-unauthenticated libwxgtk2.6-dev build-essential libncurses5-dev zlib1g-dev ia32-libs
echo "Y" | apt-get install --allow-unauthenticated lib32z1-dev lib32ncurses5-dev gcc-multilib g++-multilib pngcrush 
echo "Y" | apt-get install --allow-unauthenticated squashfs-tools squashfs-tools-dbg wget schedtool libc6-dev 
echo "Y" | apt-get install --allow-unauthenticated x11proto-core-dev libx11-dev lib32readline5-dev lib32z-dev 
echo "Y" | apt-get install --allow-unauthenticated libgl1-mesa-dev mingw32 gcc-4.3-multilib g++-4.3-multilib
echo "Y" | apt-get install --allow-unauthenticated xserver-xorg-input-evtouch dpkg-dev
echo "Y" | apt-get install --allow-unauthenticated libnss3-tools rpl
echo "Y" | apt-get install --allow-unauthenticated bouml; # install bouml

# install LaTeX
echo "Y" | apt-get install --allow-unauthenticated gedit-latex-plugin texlive-fonts-recommended latex-beamer texpower
echo "Y" | apt-get install --allow-unauthenticated texlive-pictures texlive-latex-extra texpower-examples imagemagick
echo "Y" | apt-get install --allow-unauthenticated texlive texlive-full
#/install LaTeX

echo "Y" | apt-get install --allow-unauthenticated qt-creator qt4-qtconfig qt4-qmake qt4-dev-tools qt4-designer # QT

echo "Installing skype"
echo "Y" | add-apt-repository "deb http://archive.canonical.com/ubuntu maverick partner"
echo "Y" | apt-get update
echo "Y" | apt-get install --allow-unauthenticated skype

# install crebs for create wallpapers slideshow
add-apt-repository ppa:crebs/ppa
echo "Y" | apt-get update
echo "Y" | apt-get install --allow-unauthenticated crebs
# /install crebs for create wallpapers slideshow

# install VirtualBox
grep 'deb http://download.virtualbox.org/virtualbox/debian' ~/.bashrc >> /dev/null
if [ $? != 0 ]
then
	echo "Y" | add-apt-repository "deb http://download.virtualbox.org/virtualbox/debian maverick contrib non-free"
	wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | apt-key add -
fi
echo 'Y' | apt-get update
echo 'Y' | apt-get install --allow-unauthenticated virtualbox-4.1
# /install VirtualBox

#gconftool-2 --set "/apps/metacity/general/button_layout" --type string "menu:minimize,maximize,close" # close to the right

# Adding permisions for android devices
echo 'SUBSYSTEM=="usb", ATTR{idVendor}=="0bb4", MODE="0666", GROUP="plugdev"' | tee /etc/udev/rules.d/51-android.rules >> /dev/null # for htc
echo 'SUBSYSTEM=="usb", ATTR{idVendor}=="18d1", MODE="0666", GROUP="plugdev"' | tee /etc/udev/rules.d/51-android.rules >> /dev/null
echo 'SUBSYSTEM=="usb", ATTR{idVendor}=="04e8", MODE="0666", GROUP="plugdev"' | tee /etc/udev/rules.d/51-android.rules >> /dev/null
echo 'SUBSYSTEM=="usb", ATTR{idVendor}=="2080", MODE="0666", GROUP="plugdev" # Nook' | tee /etc/udev/rules.d/51-android.rules >> /dev/null
echo 'SUBSYSTEM=="usb", ATTR{idVendor}=="0502", MODE="0666", GROUP="plugdev" # Acer' | tee /etc/udev/rules.d/51-android.rules >> /dev/null 
echo 'SUBSYSTEM=="usb", ATTR{idVendor}=="22b8", MODE="0666", GROUP="plugdev" # Acer' | tee /etc/udev/rules.d/51-android.rules >> /dev/null
echo 'SUBSYSTEM=="usb", ATTR{idVendor}=="0FCE", MODE="0666", GROUP="plugdev" # Sony Ericsson' | tee /etc/udev/rules.d/51-android.rules >> /dev/null
chmod 755 /etc/udev/rules.d/51-android.rules
#/Adding permisions for android devices

#install FUSON-exFAT
#-----------------
add-apt-repository ppa:relan/exfat
echo "Y" | apt-get update
echo "Y" | apt-get install --allow-unauthenticated fuse-exfat
#-----------------

grep 'export PATH="${PATH}:~/bin"' ~/.bashrc >> /dev/null
if [ $? != 0 ]
then
	echo 'export PATH="${PATH}:~/bin"' | sudo tee -a ~/.bashrc >> /dev/null
fi

grep 'export PATH="${PATH}:~/Applications/SDK/tools"' ~/.bashrc >> /dev/null
if [ $? != 0 ]
then
	echo 'export PATH="${PATH}:~/Applications/SDK/tools"' | sudo tee -a ~/.bashrc >> /dev/null
fi

grep 'export PATH="${PATH}:~/Applications/SDK/platform-tools"' ~/.bashrc >> /dev/null
if [ $? != 0 ]
then
	echo 'export PATH="${PATH}:~/Applications/SDK/platform-tools"' | sudo tee -a ~/.bashrc >> /dev/null
fi

grep 'export PATH="${PATH}:~/bin/dex2jar"' ~/.bashrc >> /dev/null
if [ $? != 0 ]
then
	echo 'export PATH="${PATH}:~/bin/dex2jar"' | sudo tee -a ~/.bashrc >> /dev/null
fi

grep 'export PATH="${PATH}:~/Applications/NDK"' ~/.bashrc >> /dev/null
if [ $? != 0 ]
then
	echo 'export PATH="${PATH}:~/Applications/NDK"' | sudo tee -a ~/.bashrc >> /dev/null
fi

exit 0;
