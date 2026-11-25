#!/bin/sh
# Soal 3
#   - Comm-Net: IP dan gateway SEMENTARA untuk uji routing (IP permanen di soal 6).

ip addr flush dev eth0
ip addr add 192.234.2.2/24 dev eth0
ip link set eth0 up
ip route replace default via 192.234.2.1

# Bukti
ip -4 -br addr show eth0
ip route
