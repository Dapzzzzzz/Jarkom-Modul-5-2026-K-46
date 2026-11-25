#!/bin/sh
# Soal 2
#   - Kaji: IP tiap interface sesuai tabel VLSM, IPv4 forwarding aktif.

# Konfigurasi permanen (diterapkan GNS3 setiap node start)
cat > /etc/network/interfaces <<'EOF'
auto lo
iface lo inet loopback

# L13 ke Gendou
auto eth0
iface eth0 inet static
    address 192.234.4.158
    netmask 255.255.255.252
    up sysctl -w net.ipv4.ip_forward=1

# Switch-Intel
auto eth1
iface eth1 inet static
    address 192.234.4.101
    netmask 255.255.255.252
EOF

# Terapkan sekarang
ip addr flush dev eth0; ip addr add 192.234.4.158/30 dev eth0; ip link set eth0 up   # L13 ke Gendou
ip addr flush dev eth1; ip addr add 192.234.4.101/30 dev eth1; ip link set eth1 up   # Switch-Intel
sysctl -w net.ipv4.ip_forward=1

# Bukti
ip -4 -br addr
ping -c 2 -W 2 192.234.4.157   # L13 ke Gendou
