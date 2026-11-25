#!/bin/sh
# Soal 5 --- gendo.sh: seluruh konfigurasi Gendou (soal 2-5) dalam satu script.
#   Aman dijalankan berulang.
#   - Soal 2: IP tiap interface, eth0 DHCP dari NAT1, IPv4 forwarding.
#   - Soal 3: routing statis dengan rute ringkasan.
#   - Soal 4: MASQUERADE ke NAT1.
#   - Soal 5: policy INPUT dan FORWARD = DROP + empat pengecualian,
#             loopback dan DHCP dari NAT1 tetap jalan.
#   Aturan iptables disimpan di /etc/iptables.rules dan dipulihkan setiap eth0 naik.

INTERNAL=192.234.0.0/16

# ---------- Soal 2 + 3: konfigurasi permanen (diterapkan GNS3 setiap node start)
cat > /etc/network/interfaces <<'EOF'
auto lo
iface lo inet loopback

# NAT1
auto eth0
iface eth0 inet dhcp
    up sysctl -w net.ipv4.ip_forward=1
    up iptables-restore < /etc/iptables.rules   # soal 4-5

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

# ---------- Soal 2: terapkan IP sekarang
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

# ---------- Soal 3: terapkan rute sekarang
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

# ---------- Soal 4: NAT
iptables -t nat -F POSTROUTING
iptables -t nat -A POSTROUTING -s $INTERNAL -o eth0 -j MASQUERADE

# ---------- Soal 5: firewall
iptables -F INPUT
iptables -F FORWARD
iptables -P INPUT DROP
iptables -P FORWARD DROP

# Loopback
iptables -A INPUT -i lo -j ACCEPT
# (a) balasan koneksi yang sudah ada
iptables -A INPUT   -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
# DHCP dari NAT1 (server 67 -> client 68)
iptables -A INPUT -i eth0 -p udp --sport 67 --dport 68 -j ACCEPT
# (d) jaringan internal ke Gendou sendiri (bukan dari sisi NAT1)
iptables -A INPUT ! -i eth0 -s $INTERNAL -j ACCEPT
# (b) jaringan internal ke internet
iptables -A FORWARD ! -i eth0 -s $INTERNAL -o eth0 -j ACCEPT
# (c) antar-LAN
iptables -A FORWARD ! -i eth0 -s $INTERNAL ! -o eth0 -d $INTERNAL -j ACCEPT
# Selain itu (koneksi baru dari NAT1) jatuh ke policy DROP.

# Simpan agar dipulihkan saat eth0 naik
iptables-save > /etc/iptables.rules

# ---------- Bukti
ip -4 -br addr
iptables -S
iptables -t nat -S POSTROUTING
