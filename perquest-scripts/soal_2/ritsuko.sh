#!/bin/sh
# Soal 2
#   - Ritsuko: IP tiap interface sesuai tabel VLSM, IPv4 forwarding aktif.

# Konfigurasi permanen (diterapkan GNS3 setiap node start)
cat > /etc/network/interfaces <<'EOF'
auto lo
iface lo inet loopback

# L7 ke Asuka
auto eth0
iface eth0 inet static
    address 192.234.4.134
    netmask 255.255.255.252
    up sysctl -w net.ipv4.ip_forward=1

# Switch-Lab
auto eth1
iface eth1 inet static
    address 192.234.4.49
    netmask 255.255.255.248
EOF

# Terapkan sekarang
ip addr flush dev eth0; ip addr add 192.234.4.134/30 dev eth0; ip link set eth0 up   # L7 ke Asuka
ip addr flush dev eth1; ip addr add 192.234.4.49/29 dev eth1; ip link set eth1 up   # Switch-Lab
sysctl -w net.ipv4.ip_forward=1

# Bukti
ip -4 -br addr
ping -c 2 -W 2 192.234.4.133   # L7 ke Asuka
