#!/bin/bash

#This script is necessary to run correctly Davinci Resolve on Fedora 39 with an Nvidia GPU. For those who had an AMD GPU is also correct to use this script
#but to make Davinci Resolve fully working there are a few additional steps that are not convered with this script because may vary depending on the GPU and ROCM/MESA installed.


#Fist : Move the outdated library that Davinci ship with is own installer to a secure folder created in Davinci libs directory

cd /opt/resolve/libs
mkdir disabled-libraries
mv libglib* disabled-libraries
mv libgio* disabled-libraries
mv libgmodule* disabled-libraries



