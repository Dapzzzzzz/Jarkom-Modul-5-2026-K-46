#!/bin/sh
# Soal 6
#   - Relay-Node: IP statis 192.234.3.226/27 di Switch-Relay, gateway 192.234.3.225.
#   - Nameserver 8.8.8.8 (soal 4).

# Konfigurasi permanen (diterapkan GNS3 setiap node start)
cat > /etc/network/interfaces <<'EOF'
auto lo
iface lo inet loopback

# Switch-Relay
auto eth0
iface eth0 inet static
    address 192.234.3.226
    netmask 255.255.255.224
    gateway 192.234.3.225
    up echo "nameserver 8.8.8.8" > /etc/resolv.conf
EOF

# Terapkan sekarang
ip addr flush dev eth0
ip addr add 192.234.3.226/27 dev eth0
ip link set eth0 up
ip route replace default via 192.234.3.225
echo "nameserver 8.8.8.8" > /etc/resolv.conf

# Bukti
ip -br addr
ping -c 2 -W 2 192.234.3.225
