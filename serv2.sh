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


echo "Creando usuario"
useradd juanca
passwd juanca:juanca
mkdir -p /var/sftp/juanca
chown root:root /var/sftp/
chmod 755 /var/sftp/
chown juanca:juanca /var/sftp/juanca/

echo "Copiando archivos"
cp /vagrant/slave/named.conf /etc/named.conf
cp /vagrant/slave/sshd_config /etc/ssh/sshd_config

service restart named
systemctl restart sshd