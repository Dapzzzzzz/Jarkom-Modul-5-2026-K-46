#!/bin/sh
# Soal 3
#   - Rei: routing statis.
#     Default route ke router atas, rute spesifik hanya untuk subnet di bawahnya.

# Konfigurasi permanen: IP soal 2 + rute (up ...) di bawah interface next hop
cat > /etc/network/interfaces <<'EOF'
auto lo
iface lo inet loopback

# L4 ke Yui
auto eth0
iface eth0 inet static
    address 192.234.4.122
    netmask 255.255.255.252
    up sysctl -w net.ipv4.ip_forward=1
    up ip route replace default via 192.234.4.121   # Yui

# Switch-Quarters
auto eth1
iface eth1 inet static
    address 192.234.0.1
    netmask 255.255.254.0
EOF

# Terapkan sekarang (replace: aman dijalankan berulang)
ip route replace default via 192.234.4.121   # Yui

# Bukti
ip route
