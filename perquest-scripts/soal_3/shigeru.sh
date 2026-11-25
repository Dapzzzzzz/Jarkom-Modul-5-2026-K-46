#!/bin/sh
# Soal 3
#   - Shigeru: routing statis.
#     Default route ke router atas, rute spesifik hanya untuk subnet di bawahnya.

# Konfigurasi permanen: IP soal 2 + rute (up ...) di bawah interface next hop
cat > /etc/network/interfaces <<'EOF'
auto lo
iface lo inet loopback

# L15 ke Gendou
auto eth0
iface eth0 inet static
    address 192.234.4.166
    netmask 255.255.255.252
    up sysctl -w net.ipv4.ip_forward=1
    up ip route replace default via 192.234.4.165   # Gendou

# Switch-Monolith
auto eth1
iface eth1 inet static
    address 192.234.4.81
    netmask 255.255.255.248

# L11 ke Makoto
auto eth2
iface eth2 inet static
    address 192.234.4.149
    netmask 255.255.255.252
    up ip route replace 192.234.4.88/29 via 192.234.4.150   # Radar (Makoto)
EOF

# Terapkan sekarang (replace: aman dijalankan berulang)
ip route replace default via 192.234.4.165   # Gendou
ip route replace 192.234.4.88/29 via 192.234.4.150   # Radar (Makoto)

# Bukti
ip route
