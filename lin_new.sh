#!/bin/bash

export dataNum=0

export TOKEN="f65b8c77ef7d72c2ff97071d71b9bdc21e3fe200226924849af3809ddb7d059e"
# root密码
export passwd="Mnjkl123@"
# 机器类型
export typen="g6-standard-2"
# 镜像名
export image="linode/ubuntu20.04"

function delete_all_instance(){
	result=$(curl -H "Authorization: Bearer $TOKEN"     https://api.linode.com/v4/linode/instances)
	id=$(echo $result |jq ".data[0].id")
	curl -H "Authorization: Bearer $TOKEN" -X DELETE https://api.linode.com/v4/linode/instances/${id}
	sleep 3
	id=$(echo $result |jq ".data[1].id")
	curl -H "Authorization: Bearer $TOKEN" -X DELETE https://api.linode.com/v4/linode/instances/${id}
	sleep 3
	id=$(echo $result |jq ".data[2].id")
	curl -H "Authorization: Bearer $TOKEN" -X DELETE https://api.linode.com/v4/linode/instances/${id}
	sleep 3
	id=$(echo $result |jq ".data[3].id")
	curl -H "Authorization: Bearer $TOKEN" -X DELETE https://api.linode.com/v4/linode/instances/${id}
	sleep 3
	id=$(echo $result |jq ".data[4].id")
	curl -H "Authorization: Bearer $TOKEN" -X DELETE https://api.linode.com/v4/linode/instances/${id}
	sleep 3
	id=$(echo $result |jq ".data[5].id")
	curl -H "Authorization: Bearer $TOKEN" -X DELETE https://api.linode.com/v4/linode/instances/${id}
	sleep 3
	id=$(echo $result |jq ".data[6].id")
	curl -H "Authorization: Bearer $TOKEN" -X DELETE https://api.linode.com/v4/linode/instances/${id}
	sleep 3
	id=$(echo $result |jq ".data[7].id")
	curl -H "Authorization: Bearer $TOKEN" -X DELETE https://api.linode.com/v4/linode/instances/${id}
	sleep 3
	id=$(echo $result |jq ".data[8].id")
	curl -H "Authorization: Bearer $TOKEN" -X DELETE https://api.linode.com/v4/linode/instances/${id}
	sleep 3
	id=$(echo $result |jq ".data[9].id")
	curl -H "Authorization: Bearer $TOKEN" -X DELETE https://api.linode.com/v4/linode/instances/${id}
	echo "=============== Delete Finish ================="
}


function create_instance(){
	sleep 5
	echo "=============== Creating ${dataNum} ================="
	export result="null"
	while [[ $result = "null" ]]; do
			export result=$(curl -H "Content-Type: application/json" \
	    -H "Authorization: Bearer $TOKEN" \
	    -X POST -d '{
	      "image": "'${image}'",
	      "root_pass": "'${passwd}'",
	      "booted": true,
	      "label": "Linode'${dataNum}'",
	      "type": "'${typen}'",
	      "region": "us-east",
	      "group": "Linode-Group"
	    }' \
	    https://api.linode.com/v4/linode/instances | jq -r '.ipv4[0]')
	    sleep 2
	done
	ip_list[${dataNum}]=${result}
	let "dataNum++"
}

function listip(){
	if [[ dataNum != 0 ]]; then
		num1=0
		echo "===================== Staring ========================="
		while [[ ${num1} -lt ${dataNum} ]]; do
			echo ${ip_list[${num1}]}
			let "num1++"
		done
		echo "===================== Finish =========================="
	fi
}

echo "=============== Installing ================="
sudo apt install -y jq pssh sshpass > /dev/null
ln -s /usr/bin/parallel-ssh /usr/bin/pssh > /dev/null
echo "=============== Finish ====================="


# 创建多少鸡，就是多少行
create_instance
create_instance
create_instance
create_instance
create_instance
create_instance

# 列出所有ip
listip