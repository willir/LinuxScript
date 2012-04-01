#!/bin/bash

curDir=`pwd`;

scriptDir=${0%/*};
cd $scriptDir;
scriptDir=`pwd`;
cd $curDir

sudo echo "";

mkdir ~/bin
mkdir ~/Programs

grep 'export PATH="${PATH}:~/bin"' ~/.bashrc >> /dev/null
if [ $? != 0 ]
then
	echo 'export PATH="${PATH}:~/bin"' | sudo tee -a ~/.bashrc >> /dev/null
fi

# install yaffs2 utils
rm -rf ~/Programs/yaffs2utils;
mkdir -p ~/Programs/yaffs2utils;
cd ~/Programs/yaffs2utils;

wget http://yaffs2utils.googlecode.com/files/yaffs2utils.tar.gz;
tar -zxvf yaffs2utils.tar.gz yaffs2utils;
cd yaffs2utils/src;
make;
mv unyaffs2 ~/bin
mv mkyaffs2 ~/bin
mv unspare2 ~/bin

cd $curDir
#/install yaffs2 utils

#gconftool-2 --set "/apps/metacity/general/button_layout" --type string "menu:minimize,maximize,close" # close button to the right

# download repo
curl https://dl-ssl.google.com/dl/googlesource/git-repo/repo > ~/bin/repo
chmod a+x ~/bin/repo
# /download repo

# install split_bootimg
rm -rf ~/Programs/Split_bootimg;
mkdir -p ~/Programs/Split_bootimg;
cd ~/Programs/Split_bootimg;

wget http://zen-droid.googlecode.com/files/split_bootimg.pl
chmod +x split_bootimg.pl
cp split_bootimg.pl ~/bin/split_bootimg.pl

cd $curDir
# /install split_bootimg

# install apktool
mkdir -p ~/Programs/apktool

cd ~/Programs/apktool

wget http://android-apktool.googlecode.com/files/apktool1.4.3.tar.bz2 -O apktoolGen.tar.bz2
wget http://android-apktool.googlecode.com/files/apktool-install-linux-r04-brut1.tar.bz2 -O apktoolInstLinux.tar.bz2

tar jx -f apktoolGen.tar.bz2
tar jx -f apktoolInstLinux.tar.bz2

mv apktool.jar ~/bin/apktool.jar
mv apktool ~/bin/apktool
mv aapt ~/bin/aapt

cd $curDir
#/install apktool

# download sdk
mkdir -p ~/Programs/Android

rm -rf ~/Programs/Android/SDK;
mkdir ~/Programs/Android/SDK;
cd ~/Programs/Android/SDK;

wget http://dl.google.com/android/android-sdk_r17-linux.tgz
tar -xf android-sdk_r17-linux.tgz

mkdir -p ~/Applications
mv -f android-sdk-linux/ ~/Applications/SDK

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

~/Applications/SDK/tools/android &
# /download sdk

# Download NDK
mkdir -p ~/Programs/Android

rm -rf ~/Programs/Android/NDK;
mkdir ~/Programs/Android/NDK;
cd ~/Programs/Android/NDK;

wget http://dl.google.com/android/ndk/android-ndk-r7b-linux-x86.tar.bz2
tar -jxvf android-ndk-r7b-linux-x86.tar.bz2

mkdir -p ~/Applications
mv -f android-ndk-r7b/ ~/Applications/NDK

grep 'export PATH="${PATH}:~/Applications/NDK"' ~/.bashrc >> /dev/null
if [ $? != 0 ]
then
	echo 'export PATH="${PATH}:~/Applications/NDK"' | sudo tee -a ~/.bashrc >> /dev/null
fi
# /Download NDK

# download eclipse
rm -rf ~/Programs/JAVA/Eclipse
mkdir -p ~/Programs/JAVA/Eclipse
cd ~/Programs/JAVA/Eclipse

mkdir -p ~/Applications

curl http://ftp-stud.fht-esslingen.de/pub/Mirrors/eclipse/eclipse/downloads/drops/R-3.7-201106131736/eclipse-SDK-3.7-linux-gtk-x86_64.tar.gz > eclipse.tar.gz
gzip -dc eclipse.tar.gz | tar -x
mv eclipse ~/Applications/EclipseAndroid

ln -s ~/Applications/EclipseAndroid/eclipse ~/Desktop/eclipseAndroid
~/Applications/EclipseAndroid/eclipse &

echo '==============================='
echo '==============================='
echo '==============================='
echo 'Android Development Tools - https://dl-ssl.google.com/android/eclipse/';
echo 'Android Development Tools - https://dl-ssl.google.com/android/eclipse/';
echo 'Android Development Tools - https://dl-ssl.google.com/android/eclipse/';
echo '==============================='
echo '==============================='
echo '==============================='

cd $curDir;
# /download eclipse

# install AgroUML
#mkdir -p ~/Programs/UML/AgroUML;
#cd ~/Programs/UML/AgroUML;
#curl  http://argouml-downloads.tigris.org/jws/argouml-latest-stable.jnlp > argouml-latest-stable.jnlp;
# /install AgroUML

cd $curDir;
exit 0;
