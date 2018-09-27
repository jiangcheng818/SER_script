#!/bin/bash
rmList=`docker ps -a |grep -v CONTAINER |awk '{print $1}'`
rmiNoneList=`docker images | grep "<none>" |awk '{print $3}'`
rmiVstableList=`docker images |grep -v stable |grep -v IMAGE |awk '{print $3}'`

echo `date` >> /root/clean.log
echo `docker images` >> /root/clean.log

if [ -n "$rmList" ]
  then
    docker stop $rmList
    docker rm $rmList
fi

if [ -n "$rmiNoneList" ]
  then
    docker rmi $rmiNoneList
fi

if [ -n "$rmiVstableList" ]
  then
    docker rmi $rmiVstableList
fi

echo `date` >> /root/clean.log
echo `docker images` >> /root/clean.log
