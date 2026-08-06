#!/usr/bin/env bash
#
# download-kofc275-media.sh
#
# Pulls the original images and other media from the old kofc275.org website
# out of the Internet Archive Wayback Machine, at full resolution.
#
# The old site is offline (Cloudflare DNS error 1001), so these files can only
# come from the archive. This script asks the Wayback Machine for the RAW
# archived file (the "id_" URL form), so you get the original bytes, not a
# page with the archive's toolbar wrapped around it.
#
# USAGE
#   chmod +x download-kofc275-media.sh
#   ./download-kofc275-media.sh
#
# Everything lands in ./kofc275-media/ , organized the same way it was on the
# old site (e.g. kofc275-media/2023/09/KOFC275.png).
#
# Requires: curl (preinstalled on macOS and Linux).

set -uo pipefail

OUTDIR="kofc275-media"
mkdir -p "$OUTDIR"

# Files recovered from the archive index. Format: <archive timestamp> <path under /wp-content/uploads/>
FILES=(
  # --- logo / identity ---
  "20240716062728 2023/09/KOFC275.png"
  "20240716062728 2023/09/KOFC275-1.png"

  # --- parishes and buildings ---
  "20240715204835 2023/09/AerialView_Portrait_inPixio.jpg"
  "20240715201003 2023/09/Alter_1-e1693192125882.webp"
  "20240715195734 2023/09/St.-Josephs-New-Facadeweb-e1693190569614.webp"
  "20240715203759 2023/09/scl-1.jpg"
  "20240715193756 2023/09/st-M-P.jpg"
  "20240717005607 2023/09/presentation.jpg"
  "20240716072303 2023/09/port-e1693191004107-1.jpg"
  "20240715230458 2023/09/stpeter3-e1693191747923.webp"
  "20240715204835 2023/09/StPeteFront-1.jpg"

  # --- links-page thumbnails ---
  "20240715204835 2024/03/kingston_inPixio.jpg"
  "20240715204835 2024/03/Mohonk.jpg"
  "20240715204835 2024/03/Seal_of_New_York_state.svg_.png"
  "20240715204835 2024/03/displaying-american-flag.jpg"
  "20240715204835 2023/09/HV-Logo.jpg"
  "20240715204835 2023/09/pin.webp"
  "20240715204835 2023/09/arch-ny-logo-white.webp"
  "20240715204835 2023/09/scl.jpg"

  # --- photos page ---
  "20250101000000 2024/09/jw-dolan.jpg"
  "20250101000000 2024/09/cd1.jpg"
  "20260119000000 2025/12/IMG_5679.jpg"
)

ok=0
fail=0

echo "Downloading archived media from kofc275.org ..."
echo

for entry in "${FILES[@]}"; do
  ts="${entry%% *}"
  path="${entry#* }"
  url="https://web.archive.org/web/${ts}id_/https://kofc275.org/wp-content/uploads/${path}"
  dest="$OUTDIR/$path"
  mkdir -p "$(dirname "$dest")"

  # -f fails on HTTP errors, -L follows the archive's redirect to the nearest snapshot
  if curl -fsSL --max-time 90 -o "$dest" "$url"; then
    size=$(wc -c < "$dest" | tr -d ' ')
    if [ "$size" -gt 1000 ]; then
      printf '  ok    %-55s %s bytes\n' "$path" "$size"
      ok=$((ok+1))
    else
      printf '  thin  %-55s only %s bytes (may be an error page)\n' "$path" "$size"
      fail=$((fail+1))
    fi
  else
    printf '  MISS  %-55s not in archive at that timestamp\n' "$path"
    rm -f "$dest"
    fail=$((fail+1))
  fi
  sleep 1   # be polite to the Internet Archive
done

echo
echo "Done. $ok downloaded, $fail missing or suspect."
echo "Files are in: $(pwd)/$OUTDIR"
echo
echo "To browse everything the archive holds for the old site, open:"
echo "  https://web.archive.org/web/*/kofc275.org*"
