#!/bin/sh
# Soal 3
#   - Fuyutsuki: routing statis.
#     Default route ke router atas, rute spesifik hanya untuk subnet di bawahnya.

# Konfigurasi permanen: IP soal 2 + rute (up ...) di bawah interface next hop
cat > /etc/network/interfaces <<'EOF'
auto lo
iface lo inet loopback

# L16 ke Gendou
auto eth0
iface eth0 inet static
    address 192.234.4.170
    netmask 255.255.255.252
    up sysctl -w net.ipv4.ip_forward=1
    up ip route replace default via 192.234.4.169   # Gendou

# Switch-Terminal
auto eth1
iface eth1 inet static
    address 192.234.4.57
    netmask 255.255.255.248

# L8 ke Maya
auto eth2
iface eth2 inet static
    address 192.234.4.137
    netmask 255.255.255.252
    up ip route replace 192.234.3.192/27 via 192.234.4.138   # Medic (Maya)

# L9 ke Toji
auto eth3
iface eth3 inet static
    address 192.234.4.141
    netmask 255.255.255.252
    up ip route replace 192.234.4.72/29 via 192.234.4.142   # Dogma (Toji)
EOF

# Terapkan sekarang (replace: aman dijalankan berulang)
ip route replace default via 192.234.4.169   # Gendou
ip route replace 192.234.3.192/27 via 192.234.4.138   # Medic (Maya)
ip route replace 192.234.4.72/29 via 192.234.4.142   # Dogma (Toji)

# Bukti
ip route
