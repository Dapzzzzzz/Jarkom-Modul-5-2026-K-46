#!/bin/sh
# Soal 6
#   - Comm-Net: IP statis 192.234.2.2/24 di Switch-Comm, gateway 192.234.2.1.
#   - Nameserver 8.8.8.8 (soal 4).

# Konfigurasi permanen (diterapkan GNS3 setiap node start)
cat > /etc/network/interfaces <<'EOF'
auto lo
iface lo inet loopback

# Switch-Comm
auto eth0
iface eth0 inet static
    address 192.234.2.2
    netmask 255.255.255.0
    gateway 192.234.2.1
    up echo "nameserver 8.8.8.8" > /etc/resolv.conf
EOF

# Terapkan sekarang
ip addr flush dev eth0
ip addr add 192.234.2.2/24 dev eth0
ip link set eth0 up
ip route replace default via 192.234.2.1
echo "nameserver 8.8.8.8" > /etc/resolv.conf

# Bukti
ip -br addr
ping -c 2 -W 2 192.234.2.1
