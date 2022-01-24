#!/bin/bash
# Created by github.com/piekuns
# 2022-01-24

cat /etc/fstab

read -n 1 -s -r -p "Check file system table before changes. In next step will be added entries for log,tmp,srv. Press any key to proceed `echo $'\n> '`"

if ! grep -q '/dev/mapper/vgsys-log' /etc/fstab ; then
    echo '/dev/mapper/vgsys-log /var/log              xfs     defaults    0 0' >> /etc/fstab    # if dont exist then adding entry
fi
    
if ! grep -q '/dev/mapper/vgsys-tmp' /etc/fstab ; then
    echo '/dev/mapper/vgsys-tmp /var/tmp              xfs     defaults    0 0' >> /etc/fstab    # if dont exist then adding entry
fi
    
if ! grep -q '/dev/mapper/vgsys-srv' /etc/fstab ; then
    echo '/dev/mapper/vgsys-srv /var/srv              xfs     defaults    0 0' >> /etc/fstab    # if dont exist then adding entry
fi

cat /etc/fstab

read -n 1 -s -r -p "Check file system table after changes. In next steps will be mounted all filesystems; /tmp permissions change; log files moved. Press any key to proceed `echo $'\n> '`"

mount /tmp

chmod 1777 /tmp

cp -r /var/log /tmp && mount /var/log && mv  /tmp/log/* /var/log

mount -a

read -n 1 -s -r -p "Press any key to check mounting points `echo $'\n> '`"

df -kh

read -n 1 -s -r -p "Press any key to exit `echo $'\n> '`"

exit 0
