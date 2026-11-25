#!/bin/sh
# Soal 2
#   - Shigeru: IP tiap interface sesuai tabel VLSM, IPv4 forwarding aktif.

# Konfigurasi permanen (diterapkan GNS3 setiap node start)
cat > /etc/network/interfaces <<'EOF'
auto lo
iface lo inet loopback

# L15 ke Gendou
auto eth0
iface eth0 inet static
    address 192.234.4.166
    netmask 255.255.255.252
    up sysctl -w net.ipv4.ip_forward=1

# Switch-Monolith
auto eth1
iface eth1 inet static
    address 192.234.4.81
    netmask 255.255.255.248

# L11 ke Makoto
auto eth2
iface eth2 inet static
    address 192.234.4.149
    netmask 255.255.255.252
EOF

# Terapkan sekarang
ip addr flush dev eth0; ip addr add 192.234.4.166/30 dev eth0; ip link set eth0 up   # L15 ke Gendou
ip addr flush dev eth1; ip addr add 192.234.4.81/29 dev eth1; ip link set eth1 up   # Switch-Monolith
ip addr flush dev eth2; ip addr add 192.234.4.149/30 dev eth2; ip link set eth2 up   # L11 ke Makoto
sysctl -w net.ipv4.ip_forward=1

# Bukti
ip -4 -br addr
ping -c 2 -W 2 192.234.4.165   # L15 ke Gendou
ping -c 2 -W 2 192.234.4.150   # L11 ke Makoto
