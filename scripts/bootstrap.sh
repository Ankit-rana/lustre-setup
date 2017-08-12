#!/usr/bin/env bash


# install all the required packages
yum install libss openmpi kmod-lustre kmod-lustre-osd-ldiskfs lustre lustre-osd-ldisk-mount sg3_utils lustre-tests kmod-lustre-client kernel kernel-tools kernel-headers python-perf  -y 


# set env and run llmount.sh
server=10.0.2.15            # Server Node IP address
client=10.0.2.15              # Client node IP address
mds_HOST=$server
ost_HOST=$server 
CLIENTS=$client      
PDSH=${PDSH:-"pdsh -S -w "}   # Important for node communication
SLOW=${SLOW:-yes}
OSTDEV=/tmp/lustre-ost1
MDSDEV=/tmp/lustre-mds1
OSTSIZE=65536
MDSSIZE=65536
LOAD=yes

# add modules and create loop device
# run llmount
sh /usr/lib64/lustre/tests/llmount.sh


