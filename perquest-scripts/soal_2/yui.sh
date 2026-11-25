#!/bin/sh
# Soal 2
#   - Yui: IP tiap interface sesuai tabel VLSM, IPv4 forwarding aktif.

# Konfigurasi permanen (diterapkan GNS3 setiap node start)
cat > /etc/network/interfaces <<'EOF'
auto lo
iface lo inet loopback

# L2 ke Gendou
auto eth0
iface eth0 inet static
    address 192.234.4.114
    netmask 255.255.255.252
    up sysctl -w net.ipv4.ip_forward=1

# Switch-Hangar
auto eth1
iface eth1 inet static
    address 192.234.3.1
    netmask 255.255.255.128

# L3 ke Mari
auto eth2
iface eth2 inet static
    address 192.234.4.117
    netmask 255.255.255.252

# L4 ke Rei
auto eth3
iface eth3 inet static
    address 192.234.4.121
    netmask 255.255.255.252

# L5 ke Shinji
auto eth4
iface eth4 inet static
    address 192.234.4.125
    netmask 255.255.255.252
EOF

# Terapkan sekarang
ip addr flush dev eth0; ip addr add 192.234.4.114/30 dev eth0; ip link set eth0 up   # L2 ke Gendou
ip addr flush dev eth1; ip addr add 192.234.3.1/25 dev eth1; ip link set eth1 up   # Switch-Hangar
ip addr flush dev eth2; ip addr add 192.234.4.117/30 dev eth2; ip link set eth2 up   # L3 ke Mari
ip addr flush dev eth3; ip addr add 192.234.4.121/30 dev eth3; ip link set eth3 up   # L4 ke Rei
ip addr flush dev eth4; ip addr add 192.234.4.125/30 dev eth4; ip link set eth4 up   # L5 ke Shinji
sysctl -w net.ipv4.ip_forward=1

# Bukti
ip -4 -br addr
ping -c 2 -W 2 192.234.4.113   # L2 ke Gendou
ping -c 2 -W 2 192.234.4.118   # L3 ke Mari
ping -c 2 -W 2 192.234.4.122   # L4 ke Rei
ping -c 2 -W 2 192.234.4.126   # L5 ke Shinji
