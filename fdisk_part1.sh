#!/bin/bash
# Created by github.com/piekuns
# 2022-01-14

lsblk

read -n 1 -s -r -p "Check sda2 size and press any key to proceed `echo $'\n> '`"

(
echo d;  # Delete partition
echo 2;  # Select 2nd partition
echo n;  # Add a new partition
echo p;  # Primary partition
echo 2;  # Select 2nd partition
echo ;   # First sector
echo ;   # Last sector
echo t;  # Change partition type
echo 2;  # Select 2nd partition
echo 8e; # Select HEX code
echo w   # Write changes
) | fdisk /dev/sda

partprobe             # Re-read partition table

pvresize /dev/sda2    # Resize the physical volume

lsblk

read -n 1 -s -r -p "Check sda2 size and press any key to exit `echo $'\n> '`"

exit 0
