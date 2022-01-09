#!/bin/bash

while read line
do
    # echo $line
    echo "NKNCLLiTMEsSUXyHwgsmXK4VB1kcrFZvP8Xa：${line}"
    /home/nknx/nkn-commercial/services/nkn-node/nknc asset --transfer \
	-value 10 \
	-to $line \
	--password Genylovelincent0709 \
	--wallet /root/genylee.json fee 0 --nonce 0
	echo "============================================="
	sleep 5
done < wallet20.txt