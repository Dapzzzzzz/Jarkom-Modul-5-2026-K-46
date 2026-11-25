#!/bin/sh
# Soal 2
#   - Mari: IP tiap interface sesuai tabel VLSM, IPv4 forwarding aktif.

# Konfigurasi permanen (diterapkan GNS3 setiap node start)
cat > /etc/network/interfaces <<'EOF'
auto lo
iface lo inet loopback

# L3 ke Yui
auto eth0
iface eth0 inet static
    address 192.234.4.118
    netmask 255.255.255.252
    up sysctl -w net.ipv4.ip_forward=1

# Switch-Dock
auto eth1
iface eth1 inet static
    address 192.234.4.33
    netmask 255.255.255.240
EOF

# Terapkan sekarang
ip addr flush dev eth0; ip addr add 192.234.4.118/30 dev eth0; ip link set eth0 up   # L3 ke Yui
ip addr flush dev eth1; ip addr add 192.234.4.33/28 dev eth1; ip link set eth1 up   # Switch-Dock
sysctl -w net.ipv4.ip_forward=1

# Bukti
ip -4 -br addr
ping -c 2 -W 2 192.234.4.117   # L3 ke Yui
