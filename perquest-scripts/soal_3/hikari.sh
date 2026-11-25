#!/bin/sh
# Soal 3
#   - Hikari: routing statis.
#     Default route ke router atas, rute spesifik hanya untuk subnet di bawahnya.

# Konfigurasi permanen: IP soal 2 + rute (up ...) di bawah interface next hop
cat > /etc/network/interfaces <<'EOF'
auto lo
iface lo inet loopback

# L1 ke Gendou
auto eth0
iface eth0 inet static
    address 192.234.4.110
    netmask 255.255.255.252
    up sysctl -w net.ipv4.ip_forward=1
    up ip route replace default via 192.234.4.109   # Gendou

# Switch-Comm
auto eth1
iface eth1 inet static
    address 192.234.2.1
    netmask 255.255.255.0

# L10 ke Kaworu
auto eth2
iface eth2 inet static
    address 192.234.4.145
    netmask 255.255.255.252
    up ip route replace 192.234.3.224/27 via 192.234.4.146   # Relay (Kaworu)
EOF

# Terapkan sekarang (replace: aman dijalankan berulang)
ip route replace default via 192.234.4.109   # Gendou
ip route replace 192.234.3.224/27 via 192.234.4.146   # Relay (Kaworu)

# Bukti
ip route
