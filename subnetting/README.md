# Tabel VLSM — K-46

Prefix kelompok: `192.234.0.0`. Total alokasi: `192.234.0.0` – `192.234.4.171` (1196 alamat).

Aturan:

- Kebutuhan = jumlah host + 1 (gateway). Prefix = terkecil yang usable-nya muat.
- Urut dari prefix terbesar kebutuhannya; tie-break: LAN dulu, lalu link, lalu urutan tabel.
- Gateway = IP usable pertama. Node switch dapat IP berikutnya sesuai urutan gambar kiri ke kanan.
- Link: IP pertama = router atas (arah Gendou), IP kedua = router bawah.

| No | Subnet | Tipe | Kebutuhan | Prefix | Network | Netmask | Gateway | Range | Broadcast | Usable | Terpakai | Sisa |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Switch-Quarters | LAN | 501 | /23 | 192.234.0.0 | 255.255.254.0 | 192.234.0.1 | 192.234.0.1 - 192.234.1.254 | 192.234.1.255 | 510 | 501 | 9 |
| 2 | Switch-Comm | LAN | 201 | /24 | 192.234.2.0 | 255.255.255.0 | 192.234.2.1 | 192.234.2.1 - 192.234.2.254 | 192.234.2.255 | 254 | 201 | 53 |
| 3 | Switch-Hangar | LAN | 101 | /25 | 192.234.3.0 | 255.255.255.128 | 192.234.3.1 | 192.234.3.1 - 192.234.3.126 | 192.234.3.127 | 126 | 101 | 25 |
| 4 | Switch-Bunker | LAN | 56 | /26 | 192.234.3.128 | 255.255.255.192 | 192.234.3.129 | 192.234.3.129 - 192.234.3.190 | 192.234.3.191 | 62 | 56 | 6 |
| 5 | Switch-Medic | LAN | 27 | /27 | 192.234.3.192 | 255.255.255.224 | 192.234.3.193 | 192.234.3.193 - 192.234.3.222 | 192.234.3.223 | 30 | 27 | 3 |
| 6 | Switch-Relay | LAN | 26 | /27 | 192.234.3.224 | 255.255.255.224 | 192.234.3.225 | 192.234.3.225 - 192.234.3.254 | 192.234.3.255 | 30 | 26 | 4 |
| 7 | Switch-Garden | LAN | 15 | /27 | 192.234.4.0 | 255.255.255.224 | 192.234.4.1 | 192.234.4.1 - 192.234.4.30 | 192.234.4.31 | 30 | 15 | 15 |
| 8 | Switch-Dock | LAN | 13 | /28 | 192.234.4.32 | 255.255.255.240 | 192.234.4.33 | 192.234.4.33 - 192.234.4.46 | 192.234.4.47 | 14 | 13 | 1 |
| 9 | Switch-Lab | LAN | 6 | /29 | 192.234.4.48 | 255.255.255.248 | 192.234.4.49 | 192.234.4.49 - 192.234.4.54 | 192.234.4.55 | 6 | 6 | 0 |
| 10 | Switch-Terminal | LAN | 4 | /29 | 192.234.4.56 | 255.255.255.248 | 192.234.4.57 | 192.234.4.57 - 192.234.4.62 | 192.234.4.63 | 6 | 4 | 2 |
| 11 | Switch-Cage | LAN | 4 | /29 | 192.234.4.64 | 255.255.255.248 | 192.234.4.65 | 192.234.4.65 - 192.234.4.70 | 192.234.4.71 | 6 | 4 | 2 |
| 12 | Switch-Dogma | LAN | 3 | /29 | 192.234.4.72 | 255.255.255.248 | 192.234.4.73 | 192.234.4.73 - 192.234.4.78 | 192.234.4.79 | 6 | 3 | 3 |
| 13 | Switch-Monolith | LAN | 3 | /29 | 192.234.4.80 | 255.255.255.248 | 192.234.4.81 | 192.234.4.81 - 192.234.4.86 | 192.234.4.87 | 6 | 3 | 3 |
| 14 | Switch-Radar | LAN | 5 | /29 | 192.234.4.88 | 255.255.255.248 | 192.234.4.89 | 192.234.4.89 - 192.234.4.94 | 192.234.4.95 | 6 | 5 | 1 |
| 15 | Switch-Archive | LAN | 2 | /30 | 192.234.4.96 | 255.255.255.252 | 192.234.4.97 | 192.234.4.97 - 192.234.4.98 | 192.234.4.99 | 2 | 2 | 0 |
| 16 | Switch-Intel | LAN | 2 | /30 | 192.234.4.100 | 255.255.255.252 | 192.234.4.101 | 192.234.4.101 - 192.234.4.102 | 192.234.4.103 | 2 | 2 | 0 |
| 17 | Switch-Cmd | LAN | 2 | /30 | 192.234.4.104 | 255.255.255.252 | 192.234.4.105 | 192.234.4.105 - 192.234.4.106 | 192.234.4.107 | 2 | 2 | 0 |
| 18 | L1 Gendou-Hikari | Link | 2 | /30 | 192.234.4.108 | 255.255.255.252 | 192.234.4.109 | 192.234.4.109 - 192.234.4.110 | 192.234.4.111 | 2 | 2 | 0 |
| 19 | L2 Gendou-Yui | Link | 2 | /30 | 192.234.4.112 | 255.255.255.252 | 192.234.4.113 | 192.234.4.113 - 192.234.4.114 | 192.234.4.115 | 2 | 2 | 0 |
| 20 | L3 Yui-Mari | Link | 2 | /30 | 192.234.4.116 | 255.255.255.252 | 192.234.4.117 | 192.234.4.117 - 192.234.4.118 | 192.234.4.119 | 2 | 2 | 0 |
| 21 | L4 Yui-Rei | Link | 2 | /30 | 192.234.4.120 | 255.255.255.252 | 192.234.4.121 | 192.234.4.121 - 192.234.4.122 | 192.234.4.123 | 2 | 2 | 0 |
| 22 | L5 Yui-Shinji | Link | 2 | /30 | 192.234.4.124 | 255.255.255.252 | 192.234.4.125 | 192.234.4.125 - 192.234.4.126 | 192.234.4.127 | 2 | 2 | 0 |
| 23 | L6 Asuka-Kensuke | Link | 2 | /30 | 192.234.4.128 | 255.255.255.252 | 192.234.4.129 | 192.234.4.129 - 192.234.4.130 | 192.234.4.131 | 2 | 2 | 0 |
| 24 | L7 Asuka-Ritsuko | Link | 2 | /30 | 192.234.4.132 | 255.255.255.252 | 192.234.4.133 | 192.234.4.133 - 192.234.4.134 | 192.234.4.135 | 2 | 2 | 0 |
| 25 | L8 Fuyutsuki-Maya | Link | 2 | /30 | 192.234.4.136 | 255.255.255.252 | 192.234.4.137 | 192.234.4.137 - 192.234.4.138 | 192.234.4.139 | 2 | 2 | 0 |
| 26 | L9 Fuyutsuki-Toji | Link | 2 | /30 | 192.234.4.140 | 255.255.255.252 | 192.234.4.141 | 192.234.4.141 - 192.234.4.142 | 192.234.4.143 | 2 | 2 | 0 |
| 27 | L10 Hikari-Kaworu | Link | 2 | /30 | 192.234.4.144 | 255.255.255.252 | 192.234.4.145 | 192.234.4.145 - 192.234.4.146 | 192.234.4.147 | 2 | 2 | 0 |
| 28 | L11 Shigeru-Makoto | Link | 2 | /30 | 192.234.4.148 | 255.255.255.252 | 192.234.4.149 | 192.234.4.149 - 192.234.4.150 | 192.234.4.151 | 2 | 2 | 0 |
| 29 | L12 Gendou-Asuka | Link | 2 | /30 | 192.234.4.152 | 255.255.255.252 | 192.234.4.153 | 192.234.4.153 - 192.234.4.154 | 192.234.4.155 | 2 | 2 | 0 |
| 30 | L13 Gendou-Kaji | Link | 2 | /30 | 192.234.4.156 | 255.255.255.252 | 192.234.4.157 | 192.234.4.157 - 192.234.4.158 | 192.234.4.159 | 2 | 2 | 0 |
| 31 | L14 Gendou-Misato | Link | 2 | /30 | 192.234.4.160 | 255.255.255.252 | 192.234.4.161 | 192.234.4.161 - 192.234.4.162 | 192.234.4.163 | 2 | 2 | 0 |
| 32 | L15 Gendou-Shigeru | Link | 2 | /30 | 192.234.4.164 | 255.255.255.252 | 192.234.4.165 | 192.234.4.165 - 192.234.4.166 | 192.234.4.167 | 2 | 2 | 0 |
| 33 | L16 Gendou-Fuyutsuki | Link | 2 | /30 | 192.234.4.168 | 255.255.255.252 | 192.234.4.169 | 192.234.4.169 - 192.234.4.170 | 192.234.4.171 | 2 | 2 | 0 |

## Catatan

- **Switch-Garden /27**, bukan /28: butuh 14 host + 1 gateway = 15, /28 hanya 14 usable.
- **Switch-Medic**: di gambar Medic-Bay di kiri Pen-Pen, jadi Medic-Bay dapat IP lebih dulu (beda dari urutan tabel host). Konfirmasi ke asisten.
- **Urutan link** dipilih supaya rute di Gendou bisa diringkas tepat:
  - `192.234.4.112/28` = Gendou-Yui, Yui-Mari, Yui-Rei, Yui-Shinji (cabang Yui)
  - `192.234.4.128/29` = Asuka-Kensuke, Asuka-Ritsuko (cabang Asuka)
  - `192.234.4.136/29` = Fuyutsuki-Maya, Fuyutsuki-Toji (cabang Fuyutsuki)
  - LAN `192.234.4.80/28` = Monolith + Radar (cabang Shigeru)

## IP per node

| Subnet | Node | IP | Prefix | Gateway |
|---|---|---|---|---|
| Switch-Quarters | Rei (gateway) | 192.234.0.1 | /23 | - |
| Switch-Quarters | Quarters (500 host) | 192.234.0.2 | /23 | 192.234.0.1 |
| Switch-Comm | Hikari (gateway) | 192.234.2.1 | /24 | - |
| Switch-Comm | Comm-Net (200 host) | 192.234.2.2 | /24 | 192.234.2.1 |
| Switch-Hangar | Yui (gateway) | 192.234.3.1 | /25 | - |
| Switch-Hangar | Hangar-Crew (100 host) | 192.234.3.2 | /25 | 192.234.3.1 |
| Switch-Bunker | Kensuke (gateway) | 192.234.3.129 | /26 | - |
| Switch-Bunker | Sachiel (55 host) | 192.234.3.130 | /26 | 192.234.3.129 |
| Switch-Medic | Maya (gateway) | 192.234.3.193 | /27 | - |
| Switch-Medic | Medic-Bay (25 host) | 192.234.3.194 | /27 | 192.234.3.193 |
| Switch-Medic | Pen-Pen (1 host) | 192.234.3.195 | /27 | 192.234.3.193 |
| Switch-Relay | Kaworu (gateway) | 192.234.3.225 | /27 | - |
| Switch-Relay | Relay-Node (25 host) | 192.234.3.226 | /27 | 192.234.3.225 |
| Switch-Garden | Shinji (gateway) | 192.234.4.1 | /27 | - |
| Switch-Garden | Garden-Staff (14 host) | 192.234.4.2 | /27 | 192.234.4.1 |
| Switch-Dock | Mari (gateway) | 192.234.4.33 | /28 | - |
| Switch-Dock | Dock-Crew (12 host) | 192.234.4.34 | /28 | 192.234.4.33 |
| Switch-Lab | Ritsuko (gateway) | 192.234.4.49 | /29 | - |
| Switch-Lab | Entry-Plug (3 host) | 192.234.4.50 | /29 | 192.234.4.49 |
| Switch-Lab | Dummy-Plug (2 host) | 192.234.4.51 | /29 | 192.234.4.49 |
| Switch-Terminal | Fuyutsuki (gateway) | 192.234.4.57 | /29 | - |
| Switch-Terminal | Magi-Casper (1 host) | 192.234.4.58 | /29 | 192.234.4.57 |
| Switch-Terminal | Magi-Balthasar (1 host) | 192.234.4.59 | /29 | 192.234.4.57 |
| Switch-Terminal | Magi-Melchior (1 host) | 192.234.4.60 | /29 | 192.234.4.57 |
| Switch-Cage | Misato (gateway) | 192.234.4.65 | /29 | - |
| Switch-Cage | Unit-01 (1 host) | 192.234.4.66 | /29 | 192.234.4.65 |
| Switch-Cage | Unit-02 (1 host) | 192.234.4.67 | /29 | 192.234.4.65 |
| Switch-Cage | Unit-00 (1 host) | 192.234.4.68 | /29 | 192.234.4.65 |
| Switch-Dogma | Toji (gateway) | 192.234.4.73 | /29 | - |
| Switch-Dogma | Lilith (1 host) | 192.234.4.74 | /29 | 192.234.4.73 |
| Switch-Dogma | Adam (1 host) | 192.234.4.75 | /29 | 192.234.4.73 |
| Switch-Monolith | Shigeru (gateway) | 192.234.4.81 | /29 | - |
| Switch-Monolith | Zeruel (1 host) | 192.234.4.82 | /29 | 192.234.4.81 |
| Switch-Monolith | Armisael (1 host) | 192.234.4.83 | /29 | 192.234.4.81 |
| Switch-Radar | Makoto (gateway) | 192.234.4.89 | /29 | - |
| Switch-Radar | Radar-Array (4 host) | 192.234.4.90 | /29 | 192.234.4.89 |
| Switch-Archive | Asuka (gateway) | 192.234.4.97 | /30 | - |
| Switch-Archive | Archive-Vault (1 host) | 192.234.4.98 | /30 | 192.234.4.97 |
| Switch-Intel | Kaji (gateway) | 192.234.4.101 | /30 | - |
| Switch-Intel | Spy (1 host) | 192.234.4.102 | /30 | 192.234.4.101 |
| Switch-Cmd | Gendou (gateway) | 192.234.4.105 | /30 | - |
| Switch-Cmd | Tokyo3-Core (1 host) | 192.234.4.106 | /30 | 192.234.4.105 |
| L1 Gendou-Hikari | Gendou | 192.234.4.109 | /30 | - |
| L1 Gendou-Hikari | Hikari | 192.234.4.110 | /30 | 192.234.4.109 |
| L2 Gendou-Yui | Gendou | 192.234.4.113 | /30 | - |
| L2 Gendou-Yui | Yui | 192.234.4.114 | /30 | 192.234.4.113 |
| L3 Yui-Mari | Yui | 192.234.4.117 | /30 | - |
| L3 Yui-Mari | Mari | 192.234.4.118 | /30 | 192.234.4.117 |
| L4 Yui-Rei | Yui | 192.234.4.121 | /30 | - |
| L4 Yui-Rei | Rei | 192.234.4.122 | /30 | 192.234.4.121 |
| L5 Yui-Shinji | Yui | 192.234.4.125 | /30 | - |
| L5 Yui-Shinji | Shinji | 192.234.4.126 | /30 | 192.234.4.125 |
| L6 Asuka-Kensuke | Asuka | 192.234.4.129 | /30 | - |
| L6 Asuka-Kensuke | Kensuke | 192.234.4.130 | /30 | 192.234.4.129 |
| L7 Asuka-Ritsuko | Asuka | 192.234.4.133 | /30 | - |
| L7 Asuka-Ritsuko | Ritsuko | 192.234.4.134 | /30 | 192.234.4.133 |
| L8 Fuyutsuki-Maya | Fuyutsuki | 192.234.4.137 | /30 | - |
| L8 Fuyutsuki-Maya | Maya | 192.234.4.138 | /30 | 192.234.4.137 |
| L9 Fuyutsuki-Toji | Fuyutsuki | 192.234.4.141 | /30 | - |
| L9 Fuyutsuki-Toji | Toji | 192.234.4.142 | /30 | 192.234.4.141 |
| L10 Hikari-Kaworu | Hikari | 192.234.4.145 | /30 | - |
| L10 Hikari-Kaworu | Kaworu | 192.234.4.146 | /30 | 192.234.4.145 |
| L11 Shigeru-Makoto | Shigeru | 192.234.4.149 | /30 | - |
| L11 Shigeru-Makoto | Makoto | 192.234.4.150 | /30 | 192.234.4.149 |
| L12 Gendou-Asuka | Gendou | 192.234.4.153 | /30 | - |
| L12 Gendou-Asuka | Asuka | 192.234.4.154 | /30 | 192.234.4.153 |
| L13 Gendou-Kaji | Gendou | 192.234.4.157 | /30 | - |
| L13 Gendou-Kaji | Kaji | 192.234.4.158 | /30 | 192.234.4.157 |
| L14 Gendou-Misato | Gendou | 192.234.4.161 | /30 | - |
| L14 Gendou-Misato | Misato | 192.234.4.162 | /30 | 192.234.4.161 |
| L15 Gendou-Shigeru | Gendou | 192.234.4.165 | /30 | - |
| L15 Gendou-Shigeru | Shigeru | 192.234.4.166 | /30 | 192.234.4.165 |
| L16 Gendou-Fuyutsuki | Gendou | 192.234.4.169 | /30 | - |
| L16 Gendou-Fuyutsuki | Fuyutsuki | 192.234.4.170 | /30 | 192.234.4.169 |

## Contoh hitungan satu subnet: Switch-Garden

1. Kebutuhan: Garden-Staff 14 host + 1 gateway (Shinji) = **15 alamat**.
2. Cari prefix terkecil yang muat: usable = 2^(32 - prefix) - 2.
   - /28 → 2^4 - 2 = 14 usable → **tidak muat** (14 < 15).
   - /27 → 2^5 - 2 = 30 usable → muat. Pakai **/27** (netmask 255.255.255.224).
3. Posisi: subnet sebelumnya (Switch-Relay `192.234.3.224/27`) berakhir di `192.234.3.255`, jadi Garden mulai di `192.234.4.0`.
4. Ukuran blok /27 = 32 alamat → `192.234.4.0` sampai `192.234.4.31`.
   - Network: `192.234.4.0`
   - Gateway (usable pertama, Shinji): `192.234.4.1`
   - Garden-Staff: `192.234.4.2`
   - Usable terakhir: `192.234.4.30`
   - Broadcast: `192.234.4.31`
5. Terpakai 15 dari 30 usable → sisa 15.

## Pohon IP

Lihat `pohon-ip.png` / `pohon-ip.svg`. Jalur Dummy-Plug ke Armisael dilingkari merah:
Switch-Lab (`192.234.4.48/29`) → L7 Asuka-Ritsuko (`192.234.4.132/30`) → L12 Gendou-Asuka (`192.234.4.152/30`) → L15 Gendou-Shigeru (`192.234.4.164/30`) → Switch-Monolith (`192.234.4.80/29`).
