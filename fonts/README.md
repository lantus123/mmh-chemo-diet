# 字型資料夾

本頁主標與內文使用 **LINE Seed TW（繁體中文版）**，已內建為 subset woff2：

| 字重 | 檔名 | 用途 |
|------|------|------|
| Regular (400)   | `LINESeedTW_Rg.woff2` | 內文 |
| Bold (700)      | `LINESeedTW_Bd.woff2` | 粗體、標題 |
| ExtraBold (800) | `LINESeedTW_Eb.woff2` | 主標、區塊標題 |

## 來源與授權

- 來源：[LINE Seed TW](https://seed.line.me)（LY Corporation）。
- 授權：**SIL Open Font License 1.1**，全文見 [`LINE_Seed_TW_OFL.txt`](LINE_Seed_TW_OFL.txt)；
  OFL 允許自由 subset／轉檔／嵌入／散布（不可單獨販售），版權與授權聲明亦已保留在 woff2 的 name table 內。

## 為什麼是 subset

LINE Seed TW 完整 CJK woff2 每個約 3.5MB（三字重共 ~10MB），對網頁過重。
這裡只擷取本頁實際用到的字 + 常用標點安全範圍，每個壓到約 200KB（共 ~630KB），
其餘字（如 emoji `📞⚠`、符號 `✓✕・`）字型本身沒有，會自動退回 Noto Sans TC／系統字。

## 文字改很多時如何重建

```bash
python3 -m pip install --user fonttools brotli   # 第一次才需要
bash scripts/build-fonts.sh
```

腳本會自動下載官方字型、重新 subset 並覆蓋本資料夾的 woff2 與授權檔。
