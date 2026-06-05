#!/usr/bin/env bash
#
# 重建 fonts/ 內的 LINE Seed TW subset woff2。
#
# 來源：LINE Seed TW（官方，SIL OFL 1.1），https://seed.line.me
# 做法：下載官方 OTF → 只擷取 index.html 用到的字（subset）→ 轉 woff2。
#   完整 CJK woff2 每個約 3.5MB；subset 後每個約 200KB。
#
# 何時要重跑：index.html 的「文字」有大幅增刪、出現新字時。
# 需求：python3 + fonttools + brotli
#   python3 -m pip install --user fonttools brotli
#
# 用法：bash scripts/build-fonts.sh
set -euo pipefail

HERE="$(cd "$(dirname "$0")/.." && pwd)"
URL="https://seed.line.me/src/images/fonts/LINE_Seed_TW.zip"
ZIP="${LINESEED_ZIP:-/tmp/LINE_Seed_TW.zip}"
WORK="$(mktemp -d)"
trap 'rm -rf "$WORK"' EXIT

# 1) 下載官方字型包（已存在就沿用，可用 LINESEED_ZIP 指定本地檔）
if [ ! -f "$ZIP" ]; then
  echo "下載 LINE Seed TW ..."
  curl -fSL "$URL" -o "$ZIP"
fi

# 2) 解出 Regular/Bold/ExtraBold OTF 與授權（用 wildcard 容忍版本資料夾改名）
unzip -o -j "$ZIP" \
  "*/OTF/LINESeedTW_OTF_Rg.otf" \
  "*/OTF/LINESeedTW_OTF_Bd.otf" \
  "*/OTF/LINESeedTW_OTF_Eb.otf" \
  "*/license.txt" -d "$WORK" >/dev/null
cp "$WORK/license.txt" "$HERE/fonts/LINE_Seed_TW_OFL.txt"

# 3) subset → woff2（保留所有 name records 以含版權/授權；補常用標點範圍當安全邊際）
for w in Rg Bd Eb; do
  python3 -m fontTools.subset "$WORK/LINESeedTW_OTF_$w.otf" \
    --output-file="$HERE/fonts/LINESeedTW_$w.woff2" --flavor=woff2 \
    --text-file="$HERE/index.html" \
    --unicodes=U+0020-007E,U+00A0-00FF,U+2000-206F,U+3000-303F,U+FF00-FFEF \
    --layout-features='*' --name-IDs='*' --desubroutinize
  echo "  fonts/LINESeedTW_$w.woff2  $(du -h "$HERE/fonts/LINESeedTW_$w.woff2" | cut -f1)"
done

echo "完成。"
