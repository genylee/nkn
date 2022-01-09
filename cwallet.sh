#!/bin/bash

# 钱包数量
num=30
# 钱包密码
password="KentLovelincent0709"


a=1
while [[ a -le num ]]; do
	/home/nknx/nkn-commercial/services/nkn-node/nknc wallet -c -n wallet${a}.json -p ${password}
	let "a++"
done