# dhcpd
dhcpd server based on alpine

# docker build
```
docker build -f ./Dockerfile-dhcpd -t zmart/dhcpd .
```

# docker run
Make sure that a folder with ```dhcpd.conf``` file is mapped to ```/etc/dhcp``` in the container. The last parameter is either the interface name or the command you want to run in docker.

```
docker run --rm -dit --name dhcpd --net host -v $PWD/conf:/etc/dhcp -p 67:67/udp zmart/dhcpd eno1
```

# to test
```
sudo nmap --script broadcast-dhcp-discover -e eno1
```
