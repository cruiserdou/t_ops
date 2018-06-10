#!/bin/bash

list=`cat login_info.txt`
for val in $list
do
    ip=`echo $val | awk -F ':' '{print $1}'`
    user_nm=`echo $val | awk -F ':' '{print $2}'`
    port=`echo $val | awk -F ':' '{print $3}'`
    password=`echo $val | awk -F ':' '{print $4}'`

    ./hi.sh $ip $user_nm $password
done