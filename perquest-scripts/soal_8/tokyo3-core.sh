#!/bin/sh
# Soal 8
#   - Tokyo3-Core: layanan nc agar kondisi normal diketahui.
#     Port 80 dijawab "Welcome to {hostname}".
#     Port 8080 dijawab "syifa imutz".
#   - nc (OpenBSD) berhenti setelah satu koneksi, jadi dijalankan ulang dalam loop.
#     -N menutup koneksi setelah balasan terkirim, sehingga klien tidak menggantung.
#   - Koneksi yang masuk dicatat di /root/nc_<port>.log.

serve() {
    port=$1; reply=$2
    pkill -f "nc-service-$port" 2>/dev/null
    pkill -f "nc -v -n -l -N $port" 2>/dev/null
    : > /root/nc_$port.log
    setsid sh -c "while true; do echo \"$reply\" | nc -v -n -l -N $port >> /root/nc_$port.log 2>&1; done # nc-service-$port" \
        < /dev/null > /dev/null 2>&1 &
}
serve 80 "Welcome to $(hostname)"
serve 8080 "syifa imutz"
sleep 1

# Bukti
ss -tlnp
