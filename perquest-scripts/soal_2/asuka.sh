#!/bin/sh
# Soal 2
#   - Asuka: IP tiap interface sesuai tabel VLSM, IPv4 forwarding aktif.

# Konfigurasi permanen (diterapkan GNS3 setiap node start)
cat > /etc/network/interfaces <<'EOF'
auto lo
iface lo inet loopback

# L12 ke Gendou
auto eth0
iface eth0 inet static
    address 192.234.4.154
    netmask 255.255.255.252
    up sysctl -w net.ipv4.ip_forward=1

# Switch-Archive
auto eth1
iface eth1 inet static
    address 192.234.4.97
    netmask 255.255.255.252

# L6 ke Kensuke
auto eth2
iface eth2 inet static
    address 192.234.4.129
    netmask 255.255.255.252

# L7 ke Ritsuko
auto eth3
iface eth3 inet static
    address 192.234.4.133
    netmask 255.255.255.252
EOF

# Terapkan sekarang
ip addr flush dev eth0; ip addr add 192.234.4.154/30 dev eth0; ip link set eth0 up   # L12 ke Gendou
ip addr flush dev eth1; ip addr add 192.234.4.97/30 dev eth1; ip link set eth1 up   # Switch-Archive
ip addr flush dev eth2; ip addr add 192.234.4.129/30 dev eth2; ip link set eth2 up   # L6 ke Kensuke
ip addr flush dev eth3; ip addr add 192.234.4.133/30 dev eth3; ip link set eth3 up   # L7 ke Ritsuko
sysctl -w net.ipv4.ip_forward=1

# Bukti
ip -4 -br addr
ping -c 2 -W 2 192.234.4.153   # L12 ke Gendou
ping -c 2 -W 2 192.234.4.130   # L6 ke Kensuke
ping -c 2 -W 2 192.234.4.134   # L7 ke Ritsuko
