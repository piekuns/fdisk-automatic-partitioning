#!/bin/bash
# Created by github.com/piekuns
# 2022-01-24

lsblk

read -n 1 -s -r -p "Check root partition size and press any key to proceed `echo $'\n> '`"

read -p "Write number in GB for root partition. This will be expanded from sda2 to sda2/vgsys-root Leave free space for next partitions (srv/tmp/log) which will be created in next script: `echo $'\n> '`" SIZE

lvresize --resizefs -L +"$SIZE"G /dev/vgsys/root    # Add space to the root directory

lsblk

read -n 1 -s -r -p "Check swap partition size and press any key to proceed `echo $'\n> '`"

read -p "Write number in GB for swap partition. This will be expanded from sda2 to sda2/vgsys-swap: `echo $'\n> '`" SIZE2

swapoff -v /dev/vgsys/swap                          # Deactivate swap area

lvresize /dev/vgsys/swap -L +"$SIZE2"G              # Add necessary space to swap area

mkswap /dev/vgsys/swap                              # Set up swap area

swapon -va                                          # Activate swap area

lsblk

read -n 1 -s -r -p "Check root and swap partitions after expanding and press any key to exit `echo $'\n> '`"

exit 0
