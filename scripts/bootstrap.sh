#!/usr/bin/env bash


# install all the required packages
echo "-install all the required packages"
yum install libss openmpi kmod-lustre kmod-lustre-osd-ldiskfs lustre lustre-osd-ldisk-mount sg3_utils lustre-tests kmod-lustre-client kernel kernel-tools kernel-headers python-perf  -y 

# set machine passwordless access
echo "-set machine passwordless access"
echo -e "\n\n\n" | ssh-keygen -t rsa
ssh-copy-id localhost

# set ip in /etc/hosts
echo "- adding entry in /etc/hosts"
ip=$(hostname -I)
sudo echo "$ip localhost localhost.localdomain localhost4 localhost4.localdomain4"  | cat - /etc/hosts > temp && mv -f temp /etc/hosts && rm -f temp

# run llmount
echo "- creating loop device and mounting fs"
cd /usr/lib64/lustre/tests/
./llmount.sh

echo done
