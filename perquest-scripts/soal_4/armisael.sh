#!/bin/sh
# Soal 4
#   - Node uji: nameserver sementara (dibuat permanen di soal 6), lalu uji internet.

echo "nameserver 8.8.8.8" > /etc/resolv.conf

# Bukti
ping -c 3 8.8.8.8
ping -c 3 deb.debian.org
