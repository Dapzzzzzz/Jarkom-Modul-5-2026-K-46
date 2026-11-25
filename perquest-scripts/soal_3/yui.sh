#!/bin/sh
# Soal 3
#   - Yui: routing statis.
#     Default route ke router atas, rute spesifik hanya untuk subnet di bawahnya.

# Konfigurasi permanen: IP soal 2 + rute (up ...) di bawah interface next hop
cat > /etc/network/interfaces <<'EOF'
auto lo
iface lo inet loopback

# L2 ke Gendou
auto eth0
iface eth0 inet static
    address 192.234.4.114
    netmask 255.255.255.252
    up sysctl -w net.ipv4.ip_forward=1
    up ip route replace default via 192.234.4.113   # Gendou

# Switch-Hangar
auto eth1
iface eth1 inet static
    address 192.234.3.1
    netmask 255.255.255.128

# L3 ke Mari
auto eth2
iface eth2 inet static
    address 192.234.4.117
    netmask 255.255.255.252
    up ip route replace 192.234.4.32/28 via 192.234.4.118   # Dock (Mari)

# L4 ke Rei
auto eth3
iface eth3 inet static
    address 192.234.4.121
    netmask 255.255.255.252
    up ip route replace 192.234.0.0/23 via 192.234.4.122   # Quarters (Rei)

# L5 ke Shinji
auto eth4
iface eth4 inet static
    address 192.234.4.125
    netmask 255.255.255.252
    up ip route replace 192.234.4.0/27 via 192.234.4.126   # Garden (Shinji)
EOF

# Terapkan sekarang (replace: aman dijalankan berulang)
ip route replace default via 192.234.4.113   # Gendou
ip route replace 192.234.4.32/28 via 192.234.4.118   # Dock (Mari)
ip route replace 192.234.0.0/23 via 192.234.4.122   # Quarters (Rei)
ip route replace 192.234.4.0/27 via 192.234.4.126   # Garden (Shinji)

# Bukti
ip route
