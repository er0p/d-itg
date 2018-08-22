#!/bin/bash

if [ -z $1 ] ; then 
	echo "usage $(basename $0) IPv4_addr(dot_notation)"
fi

IPv4_dest=$1
pkt_sizes="128 256 512 1024 1500"
flow_cnt=10
for sz in $pkt_sizes ;
do
	#echo ./create_multiflow_d-itg.sh $IPv4_dest TCP $sz $flow_cnt multi_flow_$sz
	./create_multiflow_d-itg.sh $IPv4_dest TCP $sz $flow_cnt multi_flow_$sz
done
