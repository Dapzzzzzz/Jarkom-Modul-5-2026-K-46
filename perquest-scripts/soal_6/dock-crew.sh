#!/bin/sh
# Soal 6
#   - Dock-Crew: IP statis 192.234.4.34/28 di Switch-Dock, gateway 192.234.4.33.
#   - Nameserver 8.8.8.8 (soal 4).

# Konfigurasi permanen (diterapkan GNS3 setiap node start)
cat > /etc/network/interfaces <<'EOF'
auto lo
iface lo inet loopback

# Switch-Dock
auto eth0
iface eth0 inet static
    address 192.234.4.34
    netmask 255.255.255.240
    gateway 192.234.4.33
    up echo "nameserver 8.8.8.8" > /etc/resolv.conf
EOF

# Terapkan sekarang
ip addr flush dev eth0
ip addr add 192.234.4.34/28 dev eth0
ip link set eth0 up
ip route replace default via 192.234.4.33
echo "nameserver 8.8.8.8" > /etc/resolv.conf

# Bukti
ip -br addr
ping -c 2 -W 2 192.234.4.33
