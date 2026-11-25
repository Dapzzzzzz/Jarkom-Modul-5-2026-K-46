#!/bin/sh
# Soal 3
#   - Asuka: routing statis.
#     Default route ke router atas, rute spesifik hanya untuk subnet di bawahnya.

# Konfigurasi permanen: IP soal 2 + rute (up ...) di bawah interface next hop
cat > /etc/network/interfaces <<'EOF'
auto lo
iface lo inet loopback

# L12 ke Gendou
auto eth0
iface eth0 inet static
    address 192.234.4.154
    netmask 255.255.255.252
    up sysctl -w net.ipv4.ip_forward=1
    up ip route replace default via 192.234.4.153   # Gendou

# Switch-Archive
auto eth1
iface eth1 inet static
    address 192.234.4.97
    netmask 255.255.255.252

# L6 ke Kensuke
auto eth2
iface eth2 inet static
    address 192.234.4.129
    netmask 255.255.255.252
    up ip route replace 192.234.3.128/26 via 192.234.4.130   # Bunker (Kensuke)

# L7 ke Ritsuko
auto eth3
iface eth3 inet static
    address 192.234.4.133
    netmask 255.255.255.252
    up ip route replace 192.234.4.48/29 via 192.234.4.134   # Lab (Ritsuko)
EOF

# Terapkan sekarang (replace: aman dijalankan berulang)
ip route replace default via 192.234.4.153   # Gendou
ip route replace 192.234.3.128/26 via 192.234.4.130   # Bunker (Kensuke)
ip route replace 192.234.4.48/29 via 192.234.4.134   # Lab (Ritsuko)

# Bukti
ip route
