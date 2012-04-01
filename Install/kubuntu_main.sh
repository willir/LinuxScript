#!/bin/bash

curDir=`pwd`;

scriptDir=${0%/*};
cd $scriptDir;
scriptDir=`pwd`;
cd $curDir

sudo echo "";

sudo ./kubuntu_su.sh

./kubuntu_no_su.sh

cd $curDir;
exit 0;
