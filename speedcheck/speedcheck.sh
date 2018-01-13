#!/bin/bash

get_ispeed() {
    echo $(ifconfig wlp1s0 | grep bytes | grep RX | cut -d ':' -f 2 | cut -d ' ' -f 1);
}

while [ 1 -lt 2 ]
do
    s1=`get_ispeed`;

    sleep 1s;

    s2=`get_ispeed`;

    d=$(($s2-$s1));
    
    echo "`bc <<< "scale =4; $d / 1024"` KB/s"

done
