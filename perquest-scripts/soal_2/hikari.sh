#!/bin/sh
# Soal 2
#   - Hikari: IP tiap interface sesuai tabel VLSM, IPv4 forwarding aktif.

# Konfigurasi permanen (diterapkan GNS3 setiap node start)
cat > /etc/network/interfaces <<'EOF'
auto lo
iface lo inet loopback

# L1 ke Gendou
auto eth0
iface eth0 inet static
    address 192.234.4.110
    netmask 255.255.255.252
    up sysctl -w net.ipv4.ip_forward=1

# Switch-Comm
auto eth1
iface eth1 inet static
    address 192.234.2.1
    netmask 255.255.255.0

# L10 ke Kaworu
auto eth2
iface eth2 inet static
    address 192.234.4.145
    netmask 255.255.255.252
EOF

# Terapkan sekarang
ip addr flush dev eth0; ip addr add 192.234.4.110/30 dev eth0; ip link set eth0 up   # L1 ke Gendou
ip addr flush dev eth1; ip addr add 192.234.2.1/24 dev eth1; ip link set eth1 up   # Switch-Comm
ip addr flush dev eth2; ip addr add 192.234.4.145/30 dev eth2; ip link set eth2 up   # L10 ke Kaworu
sysctl -w net.ipv4.ip_forward=1

# Bukti
ip -4 -br addr
ping -c 2 -W 2 192.234.4.109   # L1 ke Gendou
ping -c 2 -W 2 192.234.4.146   # L10 ke Kaworu
