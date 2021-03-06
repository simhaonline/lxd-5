#!/bin/bash
# remove o ambiente:
#
echo "Parando os containers (intervalo de 3 segundos para cada container)"
for maq in A1 A2 B1 R DHCP
do
	echo "Parando $maq"
	lxc exec $maq -- /sbin/poweroff
	sleep 3
done

echo "Parando os containers (intervalo de 1 segundo para cada container)"
for maq in A1 A2 B1 R DHCP
do
	echo "Removendo $maq"
	lxc delete $maq  
	sleep 1
done

echo "Removendo as redes "
for rede in redeAR redeBR
do
	lxc network delete $rede  
done

echo "Verificando como está a configuração"
lxc list
lxc network list
