#!/bin/sh
# Soal 3
#   - Gendou: routing statis.
#     Default route ke NAT1 dari DHCP.

# Konfigurasi permanen: IP soal 2 + rute (up ...) di bawah interface next hop
cat > /etc/network/interfaces <<'EOF'
auto lo
iface lo inet loopback

# NAT1
auto eth0
iface eth0 inet dhcp
    up sysctl -w net.ipv4.ip_forward=1

# Switch-Cmd
auto eth1
iface eth1 inet static
    address 192.234.4.105
    netmask 255.255.255.252

# L2 ke Yui
auto eth2
iface eth2 inet static
    address 192.234.4.113
    netmask 255.255.255.252
    up ip route replace 192.234.0.0/23 via 192.234.4.114   # Quarters (cabang Yui)
    up ip route replace 192.234.3.0/25 via 192.234.4.114   # Hangar (cabang Yui)
    up ip route replace 192.234.4.0/27 via 192.234.4.114   # Garden (cabang Yui)
    up ip route replace 192.234.4.32/28 via 192.234.4.114   # Dock (cabang Yui)
    up ip route replace 192.234.4.112/28 via 192.234.4.114   # L2-L5 link cabang Yui

# L1 ke Hikari
auto eth3
iface eth3 inet static
    address 192.234.4.109
    netmask 255.255.255.252
    up ip route replace 192.234.2.0/24 via 192.234.4.110   # Comm (cabang Hikari)
    up ip route replace 192.234.3.224/27 via 192.234.4.110   # Relay (cabang Hikari)
    up ip route replace 192.234.4.144/30 via 192.234.4.110   # L10 Hikari-Kaworu

# L12 ke Asuka
auto eth4
iface eth4 inet static
    address 192.234.4.153
    netmask 255.255.255.252
    up ip route replace 192.234.4.96/30 via 192.234.4.154   # Archive (cabang Asuka)
    up ip route replace 192.234.3.128/26 via 192.234.4.154   # Bunker (cabang Asuka)
    up ip route replace 192.234.4.48/29 via 192.234.4.154   # Lab (cabang Asuka)
    up ip route replace 192.234.4.128/29 via 192.234.4.154   # L6-L7 link cabang Asuka

# L13 ke Kaji
auto eth5
iface eth5 inet static
    address 192.234.4.157
    netmask 255.255.255.252
    up ip route replace 192.234.4.100/30 via 192.234.4.158   # Intel (Kaji)

# L14 ke Misato
auto eth6
iface eth6 inet static
    address 192.234.4.161
    netmask 255.255.255.252
    up ip route replace 192.234.4.64/29 via 192.234.4.162   # Cage (Misato)

# L15 ke Shigeru
auto eth7
iface eth7 inet static
    address 192.234.4.165
    netmask 255.255.255.252
    up ip route replace 192.234.4.80/28 via 192.234.4.166   # Monolith + Radar (cabang Shigeru)
    up ip route replace 192.234.4.148/30 via 192.234.4.166   # L11 Shigeru-Makoto

# L16 ke Fuyutsuki
auto eth8
iface eth8 inet static
    address 192.234.4.169
    netmask 255.255.255.252
    up ip route replace 192.234.4.56/29 via 192.234.4.170   # Terminal (cabang Fuyutsuki)
    up ip route replace 192.234.3.192/27 via 192.234.4.170   # Medic (cabang Fuyutsuki)
    up ip route replace 192.234.4.72/29 via 192.234.4.170   # Dogma (cabang Fuyutsuki)
    up ip route replace 192.234.4.136/29 via 192.234.4.170   # L8-L9 link cabang Fuyutsuki
EOF

# Terapkan sekarang (replace: aman dijalankan berulang)
ip route replace 192.234.0.0/23 via 192.234.4.114   # Quarters (cabang Yui)
ip route replace 192.234.3.0/25 via 192.234.4.114   # Hangar (cabang Yui)
ip route replace 192.234.4.0/27 via 192.234.4.114   # Garden (cabang Yui)
ip route replace 192.234.4.32/28 via 192.234.4.114   # Dock (cabang Yui)
ip route replace 192.234.4.112/28 via 192.234.4.114   # L2-L5 link cabang Yui
ip route replace 192.234.2.0/24 via 192.234.4.110   # Comm (cabang Hikari)
ip route replace 192.234.3.224/27 via 192.234.4.110   # Relay (cabang Hikari)
ip route replace 192.234.4.144/30 via 192.234.4.110   # L10 Hikari-Kaworu
ip route replace 192.234.4.96/30 via 192.234.4.154   # Archive (cabang Asuka)
ip route replace 192.234.3.128/26 via 192.234.4.154   # Bunker (cabang Asuka)
ip route replace 192.234.4.48/29 via 192.234.4.154   # Lab (cabang Asuka)
ip route replace 192.234.4.128/29 via 192.234.4.154   # L6-L7 link cabang Asuka
ip route replace 192.234.4.100/30 via 192.234.4.158   # Intel (Kaji)
ip route replace 192.234.4.64/29 via 192.234.4.162   # Cage (Misato)
ip route replace 192.234.4.80/28 via 192.234.4.166   # Monolith + Radar (cabang Shigeru)
ip route replace 192.234.4.148/30 via 192.234.4.166   # L11 Shigeru-Makoto
ip route replace 192.234.4.56/29 via 192.234.4.170   # Terminal (cabang Fuyutsuki)
ip route replace 192.234.3.192/27 via 192.234.4.170   # Medic (cabang Fuyutsuki)
ip route replace 192.234.4.72/29 via 192.234.4.170   # Dogma (cabang Fuyutsuki)
ip route replace 192.234.4.136/29 via 192.234.4.170   # L8-L9 link cabang Fuyutsuki

# Bukti
ip route
