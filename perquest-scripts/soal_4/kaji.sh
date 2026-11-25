#!/bin/sh
# Soal 4
#   - Router internal: nameserver 8.8.8.8 agar bisa me-resolve nama domain
#     sebelum memasang paket. 8.8.8.8 dijangkau lewat NAT di Gendou, sehingga
#     tidak bergantung pada alamat NAT1.

echo "nameserver 8.8.8.8" > /etc/resolv.conf

# Permanen: tulis ulang resolv.conf setiap eth0 naik
grep -q "nameserver 8.8.8.8" /etc/network/interfaces ||
    sed -i '/up sysctl -w net.ipv4.ip_forward=1/a\    up echo "nameserver 8.8.8.8" > /etc/resolv.conf' /etc/network/interfaces

# Bukti
cat /etc/resolv.conf
nslookup deb.debian.org | tail -2
