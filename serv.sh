#!/bin/bash
echo "configurando el resolv.conf con cat"
cat <<TEST> /etc/resolv.conf
search jd.com
nameserver 209.191.100.2 #esclavo
nameserver 192.168.100.4 #maestro
nameserver 192.168.0.177  #firewall
TEST

echo "Instalando paquetes"
sudo yum install vim -y 


echo "Copiando archivos"
cp /vagrant/named.conf /etc/named.conf
cp /vagrant/jd.com.fwd /var/named/jd.com.fwd
cp /vagrant/jd.com.rev /var/named/jd.com.rev

chmod 755 /var/named/jd.com.fwd
chmod 755 /var/named/jd.com.rev

service restart named