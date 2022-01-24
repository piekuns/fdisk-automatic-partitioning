#!/bin/bash
# Created by github.com/piekuns
# 2022-01-24

lsblk

read -n 1 -s -r -p "Check free space in sda2 partition and we will create srv,tmp,log Press any key to proceed `echo $'\n> '`"

read -p "Write number in GB for SRV This will be expanded from  sda2 to sda2/vgsys-srv `echo $'\n> '`" SIZE
read -p "Write number in GB for TMP This will be expanded from  sda2 to sda2/vgsys-tmp `echo $'\n> '`" SIZE2
read -p "Write number in GB for LOG This will be expanded from  sda2 to sda2/vgsys-log `echo $'\n> '`" SIZE3

lvcreate -n srv -L "$SIZE"G vgsys
lvcreate -n tmp -L "$SIZE2"G vgsys
lvcreate -n log -L "$SIZE3"G vgsys

lsblk

read -n 1 -s -r -p "Check created LVM. In next step will be created XFS file system for srv,tmp,log Press any key to proceed `echo $'\n> '`"

mkfs.xfs /dev/vgsys/srv
mkfs.xfs /dev/vgsys/tmp
mkfs.xfs /dev/vgsys/log

read -n 1 -s -r -p "XFS file system created for srv,tmp,log Press any key to exit `echo $'\n> '`"

exit 0
