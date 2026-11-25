#!/bin/sh
# Soal 3
#   - Misato: routing statis.
#     Default route ke router atas, rute spesifik hanya untuk subnet di bawahnya.

# Konfigurasi permanen: IP soal 2 + rute (up ...) di bawah interface next hop
cat > /etc/network/interfaces <<'EOF'
auto lo
iface lo inet loopback

# L14 ke Gendou
auto eth0
iface eth0 inet static
    address 192.234.4.162
    netmask 255.255.255.252
    up sysctl -w net.ipv4.ip_forward=1
    up ip route replace default via 192.234.4.161   # Gendou

# Switch-Cage
auto eth1
iface eth1 inet static
    address 192.234.4.65
    netmask 255.255.255.248
EOF

# Terapkan sekarang (replace: aman dijalankan berulang)
ip route replace default via 192.234.4.161   # Gendou

# Bukti
ip route
