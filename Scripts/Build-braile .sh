#!/usr/bin/env bash
# ============================================================
#  ساخت نسخه بریل فارسی (BRF + PEF)
#  Requires: liblouis-bin, liblouis-data
#  NOTE: برای متون بختیاری و IPA معتبر نیست.
# ============================================================
set -euo pipefail

SRC="src/bakhtiari.md"
OUT_DIR="dist/braille"
TABLE="src/braille/fa-custom.utb"

mkdir -p "$OUT_DIR"

# ---------- ۱. استخراج فارسی معیار ----------
echo "→ استخراج متن فارسی..."
python3 <<'PY'
import re, pathlib
text = pathlib.Path("src/bakhtiari.md").read_text(encoding="utf-8")

# حذف front matter
text = re.sub(r"^---.*?---\n", "", text, flags=re.S)
# حذف بلوک‌های en (انگلیسی)
text = re.sub(r"::: en.*?:::", "", text, flags=re.S)
# حذف بلوک warn
text = re.sub(r"::: warn.*?:::", "", text, flags=re.S)
# حذف جدول‌ها
text = re.sub(r"^\|.*\|\s*$", "", text, flags=re.M)
# حذف کد و آوانگاری (IPA)
text = re.sub(r"`[^`]+`", "", text)
text = re.sub(r"[\u0250-\u02AF\u02B0-\u02FF]", "", text)  # حذف نمادهای IPA
# حذف نشانه‌گذاری
text = re.sub(r"^#{1,6}\s+", "", text, flags=re.M)
text = re.sub(r"[*_>~]", "", text)

pathlib.Path("build/braille-input.txt").write_text(text.strip(), encoding="utf-8")
print(f"  → {len(text):,} کاراکتر برای بریل")
PY

# ---------- ۲. تبدیل به بریل ----------
echo "→ تبدیل با liblouis..."
file2brl \
  --forward \
  --translation-table="$TABLE" \
  build/braille-input.txt \
  "$OUT_DIR/bakhtiari.brf" 2>&1 | head -5 || {
    echo "⚠ file2brl ناموفق بود، استفاده از lou_translate..."
    lou_translate --forward --table="$TABLE" < build/braille-input.txt > "$OUT_DIR/bakhtiari.brf"
  }

# ---------- ۳. آماده‌سازی PEF (برای Embosser) ----------
if command -v file2brl >/dev/null 2>&1; then
  echo "→ ساخت PEF..."
  file2brl \
    --forward \
    --translation-table="$TABLE" \
    --output-format=pef \
    --page-width=40 \
    --page-height=25 \
    build/braille-input.txt \
    "$OUT_DIR/bakhtiari.pef" 2>/dev/null || echo "  (PEF تولید نشد)"
fi

# ---------- ۴. گزارش ----------
echo ""
echo "✓ خروجی‌های بریل:"
ls -lh "$OUT_DIR"/* 2>/dev/null || echo "  (خالی)"
echo ""
echo "⚠ هشدار:"
echo "  • بریل فارسی نیازمند بازبینی انسانی است."
echo "  • مدخل‌های بختیاری و IPA در این نسخه حذف شده‌اند."
echo "  • برای چاپ فیزیکی، از مرکز چاپ بریل تخصصی استفاده کنید."
