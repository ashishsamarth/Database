#!/bin/bash

#get the server hostname
vb_hostname_with_domain=$HOSTNAME
vb_hostname=$(echo $HOSTNAME|cut -d '.' -f1)

#search and remove current line with hostname at end of line in /etc/hosts
sed -i '/'$vb_hostname_with_domain'$/ d' /etc/hosts

#get current ip address of the host
vp_ip=$(/sbin/ifconfig | grep 'inet'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $2}')

#add current ip address and hostname to hosts file
echo "$vp_ip $ vb_hostname $vb_hostname_with_domain" >>/etc/hosts