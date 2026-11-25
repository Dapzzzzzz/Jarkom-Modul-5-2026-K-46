#!/bin/sh
# Soal 4
#   - Gendou: akses internet untuk seluruh jaringan internal lewat NAT1.
#     MASQUERADE memakai IP eth0 saat itu, jadi tidak perlu diubah saat IP dari NAT1 berganti.
#     Hanya sumber 192.234.0.0/16 yang keluar lewat eth0 yang diterjemahkan;
#     traffic antar-LAN tidak keluar lewat eth0 sehingga tetap membawa alamat asli.

RULE="POSTROUTING -s 192.234.0.0/16 -o eth0 -j MASQUERADE"

# Terapkan sekarang (cek dulu agar tidak dobel)
iptables -t nat -C $RULE 2>/dev/null || iptables -t nat -A $RULE

# Permanen: pasang ulang setiap eth0 naik
grep -q MASQUERADE /etc/network/interfaces ||
    sed -i "/up sysctl -w net.ipv4.ip_forward=1/a\\    up iptables -t nat -C $RULE 2>/dev/null || iptables -t nat -A $RULE" /etc/network/interfaces

# DNS Gendou sendiri didapat dari DHCP NAT1
cat /etc/resolv.conf

# Bukti
iptables -t nat -L POSTROUTING -v -n
