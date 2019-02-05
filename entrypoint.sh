#!/bin/sh -e

IFACE=""
if [ -e "/sys/class/net/$1" ]; then
	IFACE="$1"
fi

data_dir="/etc/dhcp/"

if [ -n "$IFACE" ]; then
	touch /etc/dhcp/dhcpd.leases
	/usr/sbin/dhcpd -4 -f -d --no-pid -cf /etc/dhcp/dhcpd.conf -lf /etc/dhcp/dhcpd.leases $IFACE
else
	exec "$@"
fi
