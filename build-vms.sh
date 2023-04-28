#!/bin/bash -x

export QM="sudo qm"

destroy(){
for vmid in {8001..8005}; do
 	${QM} destroy $vmid --destroy-unreferenced-disks 
done
}

rebuild(){
for i in {1..5};do
	${QM} clone 8000 800$i --pool pve-test-nodes --name n$i
done
}

qp2p() {
	#qp2p a 1 2 2 2
	local bridge=${1}line
	local leftvm=800${2}
	local leftnic=${3}
	local rightvm=800${4}
	local rightnic=${5}
  ${QM} set $leftvm  --net$leftnic  virtio=CA:FE:00:80:0${2}:0${leftnic},bridge=$bridge,mtu=9000,rate=1000
  ${QM} set $rightvm --net$rightnic virtio=CA:FE:00:80:0${4}:0${rightnic},bridge=$bridge,mtu=9000,rate=1000
}
connect(){
qp2p a 1 2 2 2
qp2p b 1 3 3 3
qp2p c 1 4 4 4
qp2p d 1 5 5 5
qp2p e 2 3 3 2
qp2p f 2 4 4 2
qp2p g 2 5 5 2
qp2p h 3 4 4 3
qp2p i 3 5 5 3
qp2p j 4 5 5 4
}

case $1 in

	destroy)
		destroy
		;;

	rebuild)
		rebuild
		;;

	connect)
		connect
		;;
esac
