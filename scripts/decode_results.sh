#!/bin/bash

pkt_sizes="128 256 512 1024 1500"
for sz in $pkt_sizes ;
do
#	./ITGSend multi_flow_$sz -l log_multi_flow_$sz
	echo "size = $sz"
	./ITGDec ./log_multi_flow_$sz | tail -6 | head -1 | awk '{print $4" "$5}'
done
