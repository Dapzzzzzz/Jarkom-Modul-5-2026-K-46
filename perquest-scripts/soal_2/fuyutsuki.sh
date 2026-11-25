#!/bin/sh
# Soal 2
#   - Fuyutsuki: IP tiap interface sesuai tabel VLSM, IPv4 forwarding aktif.

# Konfigurasi permanen (diterapkan GNS3 setiap node start)
cat > /etc/network/interfaces <<'EOF'
auto lo
iface lo inet loopback

# L16 ke Gendou
auto eth0
iface eth0 inet static
    address 192.234.4.170
    netmask 255.255.255.252
    up sysctl -w net.ipv4.ip_forward=1

# Switch-Terminal
auto eth1
iface eth1 inet static
    address 192.234.4.57
    netmask 255.255.255.248

# L8 ke Maya
auto eth2
iface eth2 inet static
    address 192.234.4.137
    netmask 255.255.255.252

# L9 ke Toji
auto eth3
iface eth3 inet static
    address 192.234.4.141
    netmask 255.255.255.252
EOF

# Terapkan sekarang
ip addr flush dev eth0; ip addr add 192.234.4.170/30 dev eth0; ip link set eth0 up   # L16 ke Gendou
ip addr flush dev eth1; ip addr add 192.234.4.57/29 dev eth1; ip link set eth1 up   # Switch-Terminal
ip addr flush dev eth2; ip addr add 192.234.4.137/30 dev eth2; ip link set eth2 up   # L8 ke Maya
ip addr flush dev eth3; ip addr add 192.234.4.141/30 dev eth3; ip link set eth3 up   # L9 ke Toji
sysctl -w net.ipv4.ip_forward=1

# Bukti
ip -4 -br addr
ping -c 2 -W 2 192.234.4.169   # L16 ke Gendou
ping -c 2 -W 2 192.234.4.138   # L8 ke Maya
ping -c 2 -W 2 192.234.4.142   # L9 ke Toji
