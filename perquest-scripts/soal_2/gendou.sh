#!/bin/sh
# Soal 2
#   - Gendou: IP tiap interface sesuai tabel VLSM, IPv4 forwarding aktif.
#   - eth0 mendapat alamat dari NAT1 lewat DHCP.

# Konfigurasi permanen (diterapkan GNS3 setiap node start)
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

# L1 ke Hikari
auto eth3
iface eth3 inet static
    address 192.234.4.109
    netmask 255.255.255.252

# L12 ke Asuka
auto eth4
iface eth4 inet static
    address 192.234.4.153
    netmask 255.255.255.252

# L13 ke Kaji
auto eth5
iface eth5 inet static
    address 192.234.4.157
    netmask 255.255.255.252

# L14 ke Misato
auto eth6
iface eth6 inet static
    address 192.234.4.161
    netmask 255.255.255.252

# L15 ke Shigeru
auto eth7
iface eth7 inet static
    address 192.234.4.165
    netmask 255.255.255.252

# L16 ke Fuyutsuki
auto eth8
iface eth8 inet static
    address 192.234.4.169
    netmask 255.255.255.252
EOF

# Terapkan sekarang
ip link set eth0 up
udhcpc -i eth0 -n -q   # NAT1
ip addr flush dev eth1; ip addr add 192.234.4.105/30 dev eth1; ip link set eth1 up   # Switch-Cmd
ip addr flush dev eth2; ip addr add 192.234.4.113/30 dev eth2; ip link set eth2 up   # L2 ke Yui
ip addr flush dev eth3; ip addr add 192.234.4.109/30 dev eth3; ip link set eth3 up   # L1 ke Hikari
ip addr flush dev eth4; ip addr add 192.234.4.153/30 dev eth4; ip link set eth4 up   # L12 ke Asuka
ip addr flush dev eth5; ip addr add 192.234.4.157/30 dev eth5; ip link set eth5 up   # L13 ke Kaji
ip addr flush dev eth6; ip addr add 192.234.4.161/30 dev eth6; ip link set eth6 up   # L14 ke Misato
ip addr flush dev eth7; ip addr add 192.234.4.165/30 dev eth7; ip link set eth7 up   # L15 ke Shigeru
ip addr flush dev eth8; ip addr add 192.234.4.169/30 dev eth8; ip link set eth8 up   # L16 ke Fuyutsuki
sysctl -w net.ipv4.ip_forward=1

# Bukti
ip -4 -br addr
ping -c 2 -W 2 $(ip route | awk '/default/ {print $3}')   # NAT1
ping -c 2 -W 2 192.234.4.114   # L2 ke Yui
ping -c 2 -W 2 192.234.4.110   # L1 ke Hikari
ping -c 2 -W 2 192.234.4.154   # L12 ke Asuka
ping -c 2 -W 2 192.234.4.158   # L13 ke Kaji
ping -c 2 -W 2 192.234.4.162   # L14 ke Misato
ping -c 2 -W 2 192.234.4.166   # L15 ke Shigeru
ping -c 2 -W 2 192.234.4.170   # L16 ke Fuyutsuki
