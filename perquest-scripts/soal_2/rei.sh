#!/bin/sh
# Soal 2
#   - Rei: IP tiap interface sesuai tabel VLSM, IPv4 forwarding aktif.

# Konfigurasi permanen (diterapkan GNS3 setiap node start)
cat > /etc/network/interfaces <<'EOF'
auto lo
iface lo inet loopback

# L4 ke Yui
auto eth0
iface eth0 inet static
    address 192.234.4.122
    netmask 255.255.255.252
    up sysctl -w net.ipv4.ip_forward=1

# Switch-Quarters
auto eth1
iface eth1 inet static
    address 192.234.0.1
    netmask 255.255.254.0
EOF

# Terapkan sekarang
ip addr flush dev eth0; ip addr add 192.234.4.122/30 dev eth0; ip link set eth0 up   # L4 ke Yui
ip addr flush dev eth1; ip addr add 192.234.0.1/23 dev eth1; ip link set eth1 up   # Switch-Quarters
sysctl -w net.ipv4.ip_forward=1

# Bukti
ip -4 -br addr
ping -c 2 -W 2 192.234.4.121   # L4 ke Yui
