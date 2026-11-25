#!/bin/sh
# Soal 7
#   - Magi-Casper: pasang iptables dan netcat-traditional,
#     lalu nyalakan listener nc di port TCP 5000.
#   - Pesan yang diterima dicatat di /root/nc_<port>.log
#     (-v menambahkan baris "connect to ... from ..." berisi IP pengirim).

# Instalasi
export DEBIAN_FRONTEND=noninteractive
apt-get update -q
apt-get install -y -q iptables netcat-traditional
update-alternatives --set nc /bin/nc.traditional
nc -h 2>&1 | head -1

# Listener: nc.traditional berhenti setelah satu koneksi, jadi diulang dalam loop.
# Loop lama dihentikan dulu agar script aman dijalankan berulang.
listen() {
    port=$1
    pkill -f "nc-listener-$port" 2>/dev/null
    pkill -f "nc.traditional -v -n -l -p $port" 2>/dev/null
    : > /root/nc_$port.log
    setsid sh -c "while true; do nc.traditional -v -n -l -p $port >> /root/nc_$port.log 2>&1; done # nc-listener-$port" \
        < /dev/null > /dev/null 2>&1 &
}
listen 5000
sleep 1

# Bukti
ss -tlnp | grep nc
