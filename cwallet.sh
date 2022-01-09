#!/bin/bash

# 钱包数量
num=30
# 钱包密码
password="Gentlovelincent0709"

rm -r /root/wallet
mkdir /root/wallet
a=1
while [[ a -le num ]]; do
	mkdir /root/wallet/wallet${a}
	cd /root/wallet/wallet${a}
	/home/nknx/nkn-commercial/services/nkn-node/nknc wallet -c -n wallet.json -p ${password}
	let "a++"
done