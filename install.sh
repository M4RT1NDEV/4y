#!/bin/bash

echo Are you using sudo or doas? (root permisions)
echo (1=sudo,2=doas)
read rootperms

if [ $rootperms == 1]
then
   make
   sudo make install
   sudo systemctl enable 4y.service   
   sudo systemctl disable getty@tty2.service
   echo Installation finished.
   echo Do you wish to proceed to 4y menu?
   read proceed
elif [ $rootperms == 2 ]
then
   make
   doas make install
   doas systemctl enable 4y.service
   doas systemctl disable getty@tty2.service
   echo Installation finished.
   echo Do you wish to proceed to 4y menu? [Y/N]
   read proceed
else
   echo error: you can only choose sudo or doas. If you use something different youre gonna need to proceed to manual installation
   echo exiting installation.

if [ $proceed == Y]
then
   systemctl start 4y
else
   echo installation finished successfully, exiting.
