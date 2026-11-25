#!/bin/sh
# Soal 8
#   - Lilith: uji layanan Pen-Pen dan Tokyo3-Core, lalu port yang tidak dilayani (22).
#     Durasi dan exit code menjadi bukti bahwa port 22 langsung ditolak, bukan menggantung.

probe() {
    start=$(date +%s%N)
    out=$(nc -v -n -w 5 $1 $2 < /dev/null 2>&1)
    rc=$?
    ms=$(( ($(date +%s%N) - start) / 1000000 ))
    echo "== $1:$2 exit=$rc durasi=${ms}ms"
    echo "$out"
}

probe 192.234.3.195 80     # Pen-Pen
probe 192.234.4.106 80     # Tokyo3-Core
probe 192.234.4.106 8080   # Tokyo3-Core
probe 192.234.3.195 22     # Pen-Pen, tidak dilayani
probe 192.234.4.106 22     # Tokyo3-Core, tidak dilayani
