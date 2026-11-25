#!/bin/sh
# Soal 3
#   - Sachiel: IP dan gateway SEMENTARA untuk uji routing (IP permanen di soal 6).

ip addr flush dev eth0
ip addr add 192.234.3.130/26 dev eth0
ip link set eth0 up
ip route replace default via 192.234.3.129

# Bukti
ip -4 -br addr show eth0
ip route
