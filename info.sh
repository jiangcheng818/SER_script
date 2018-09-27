#!/bin/bash
#display computer info
ROOT_UID=0
CPU=`cat /proc/cpuinfo | grep processor | wc -l`
HZ=`cat /proc/cpuinfo | grep "cpu MHz" | awk '{print $4}' | awk 'NR==1{print}'`
SYSINFO=`cat /etc/redhat-release`

if [ "$UID" -ne "$ROOT_UID" ]
  then
    echo "Must be root to run!!!"
    exit 1
fi

echo "You cpu have $CPU cores $HZ MHz."
echo "You system is $SYSINFO"
