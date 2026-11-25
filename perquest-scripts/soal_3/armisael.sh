#!/bin/sh
# Soal 3
#   - Armisael: IP dan gateway SEMENTARA untuk uji routing (IP permanen di soal 6).

ip addr flush dev eth0
ip addr add 192.234.4.83/29 dev eth0
ip link set eth0 up
ip route replace default via 192.234.4.81

# Bukti
ip -4 -br addr show eth0
ip route
ping -c 3 192.234.4.74    # Lilith
ping -c 3 192.234.3.130   # Sachiel
ping -c 3 192.234.2.2     # Comm-Net
