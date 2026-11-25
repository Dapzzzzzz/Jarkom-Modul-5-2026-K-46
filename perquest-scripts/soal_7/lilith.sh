#!/bin/sh
# Soal 7
#   - Lilith: kirim pesan ke listener ketiga MAGI dan ke port 5001 Balthasar.
#     -N menutup koneksi setelah pesan terkirim, -w 3 batas waktu koneksi.

send() {
    echo "$3" | nc -N -w 3 $1 $2
    echo "$1:$2 exit=$?"
}

send 192.234.4.58 5000 "Halo Casper dari Lilith (port 5000)"
send 192.234.4.59 5000 "Halo Balthasar dari Lilith (port 5000)"
send 192.234.4.59 5001 "Halo Balthasar dari Lilith (port 5001)"
send 192.234.4.60 5000 "Halo Melchior dari Lilith (port 5000)"
