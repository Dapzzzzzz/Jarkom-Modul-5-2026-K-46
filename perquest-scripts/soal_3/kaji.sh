#!/bin/sh
# Soal 3
#   - Kaji: routing statis.
#     Default route ke router atas, rute spesifik hanya untuk subnet di bawahnya.

# Konfigurasi permanen: IP soal 2 + rute (up ...) di bawah interface next hop
cat > /etc/network/interfaces <<'EOF'
auto lo
iface lo inet loopback

# L13 ke Gendou
auto eth0
iface eth0 inet static
    address 192.234.4.158
    netmask 255.255.255.252
    up sysctl -w net.ipv4.ip_forward=1
    up ip route replace default via 192.234.4.157   # Gendou

# Switch-Intel
auto eth1
iface eth1 inet static
    address 192.234.4.101
    netmask 255.255.255.252
EOF

# Terapkan sekarang (replace: aman dijalankan berulang)
ip route replace default via 192.234.4.157   # Gendou

# Bukti
ip route
