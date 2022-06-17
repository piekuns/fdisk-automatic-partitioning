# Automatic partitioning on CentOS 7
#### Take virtual machine snapshot. There can be some minor mistakes in characters.

##### fdisk_part1.sh
###### + Expanding space from sda to sda2
###### + Tested on CentOS 7 at 14.01.2022
###### - Need check control in fdisk pipeline. If "command not found" then abort next commands in script
##### fdisk_part2.sh
###### + Expanding space from sda2 to root and swap partitions
##### fdisk_part3.sh
###### + Expanding space from sda2 to srv, tmp and log
###### + Created as Logical Volumes(LVM)
###### + Created as XFS file system partitions
##### fdisk_part4.sh
###### + Adding newly created partitions in fstab file for auto-mount after reboot. Check control with already existing entries
###### + Mounting all filesystems right now
###### + Permission change for tmp partition
