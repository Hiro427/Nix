#!/usr/bin/env bash

#!/usr/bin/env bash
set -euo pipefail
export LC_ALL=C

JSON=$(rocm-smi --showuse --showmemuse --showtemp --json 2>/dev/null || echo '[]')

AVG_USE=$(echo "$JSON" | jq -r '[.[].["GPU use (%)"] // .["GPU use"] | gsub("[^0-9.]";"") | tonumber?] | add/length')
AVG_TEMP=$(echo "$JSON" | jq -r '[.[].["Temperature (Sensor edge) (C)"] | tonumber?] | add/length')
AVG_MEM=$(echo "$JSON" | jq -r '[.[].["GPU Memory Allocated (VRAM%)"] // .["GPU Memory Used (%)"] | gsub("[^0-9.]";"") | tonumber?] | add/length')

AVG_USE=${AVG_USE:-0}
AVG_TEMP=${AVG_TEMP:-0}
AVG_MEM=${AVG_MEM:-0}

TEXT=$(printf '  %.1f%%' "$AVG_USE")
# Build tooltip text safely — escape newlines for JSON correctness
ALT=$(printf 'Temp: %.1f°C VRAM: %.1f%%' "$AVG_TEMP" "$AVG_MEM")

# Use jq to build absolutely valid JSON
jq -nc --arg text "$TEXT" --arg alt "$ALT" --arg cls "gpu" \
	'{text: $text, alt: $alt, class: $cls}'
