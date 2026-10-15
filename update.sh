#!/bin/bash
# เปลี่ยนปลายทางของลิงก์ถาวร (QR ไม่เปลี่ยน): bash update.sh https://<ที่อยู่ใหม่>
set -e; cd "$(dirname "$0")"; N="${1%/}"; [ -n "$N" ] || { echo "ใส่ที่อยู่ใหม่"; exit 1; }
for f in index.html 404.html; do sed -i -E "s#https://[a-z0-9.-]+(/)?(['\"])#$N\2#g; s#url=https://[^\"]+#url=$N#; s#href=\"https://[^\"]+\"#href=\"$N\"#" "$f"; done
git add -A && git commit -qm "ปลายทาง: $N" && git push -q origin main && echo "อัปเดตแล้ว → $N"
