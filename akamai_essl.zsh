#!/bin/zsh

# Example:
# 	sudo zsh akamai_essl.zsh www.example.com www-2.example.com www-3.example.com

# create a backup of hosts file
mv /etc/hosts /etc/hosts.backup

# loop over hostnames
for host in "$@"
do

# grab IPs for Akamai ESSL
staging_hostname=$(dig +short $host \
	| awk 'FNR <= 1' \
	| sed 's/edgekey/edgekey-staging/g')

staging_ip=$(dig +short $staging_hostname \
	| awk 'NR == 2')

# update hosts file with new staging IPs
echo "$staging_ip $host" >> /etc/hosts
done

echo 'Hosts file updated:'
cat /etc/hosts
echo ''

# restore files
read -s -k '?Press any key to restore hosts file...'
mv /etc/hosts.backup /etc/hosts

echo 'Done!'

