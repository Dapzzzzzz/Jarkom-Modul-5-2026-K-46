#!/bin/sh
# Soal 3
#   - Toji: routing statis.
#     Default route ke router atas, rute spesifik hanya untuk subnet di bawahnya.

# Konfigurasi permanen: IP soal 2 + rute (up ...) di bawah interface next hop
cat > /etc/network/interfaces <<'EOF'
auto lo
iface lo inet loopback

# L9 ke Fuyutsuki
auto eth0
iface eth0 inet static
    address 192.234.4.142
    netmask 255.255.255.252
    up sysctl -w net.ipv4.ip_forward=1
    up ip route replace default via 192.234.4.141   # Fuyutsuki

# Switch-Dogma
auto eth1
iface eth1 inet static
    address 192.234.4.73
    netmask 255.255.255.248
EOF

# Terapkan sekarang (replace: aman dijalankan berulang)
ip route replace default via 192.234.4.141   # Fuyutsuki

# Bukti
ip route
