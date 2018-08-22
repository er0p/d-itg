#!/bin/bash


#-a 10.0.0.3 -rp 10001 -C 1000 -c 512 -T UDP

function usage() {
	echo "usage: $(basename $0) IPv4_dest L4_type packet_size flow_count output_file"
	exit 127
}

if test "$#" -ne 5; then
       usage
fi

IPv4_dest=$1
L4_type=$2
packet_size=$3
flow_count=$4
#duration=10000 #10sec
duration=60000 #60sec
rate=10000000000
source_port_base=10000
destination_port_base=20000
output_file=$5

rm -f $output_file

for i in `seq 1 ${flow_count}` ;
do
	#echo "-a ${IPv4_dest} -rp $((${destination_port_base}+$i)) -C 10000 -c ${packet_size} -T ${L4_type}" | tee -a $output_file
	#echo "-a ${IPv4_dest} -Ssp ${source_port_base} -Sdp ${destination_port_base} -sp $((${source_port_base}+$i)) -rp $((${destination_port_base}+$i)) -C 10000  -d ${duration} -c ${packet_size} -T ${L4_type}" | tee -a $output_file
	echo "-a ${IPv4_dest} -Ssp ${source_port_base} -Sdp ${destination_port_base} -sp $((${source_port_base}+$i)) -rp $((${destination_port_base}+$i)) -t ${duration} -C ${rate} -c ${packet_size} -T ${L4_type} -D" | tee -a $output_file
done

echo ""
echo ""
echo ""
echo "./ITGRecv -Sp ${destination_port_base}"
echo "./ITGSend ${output_file} -l log"
echo "./ITGDec ./log"
echo ""
echo ""
echo ""


