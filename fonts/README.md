# 字型資料夾

頁面 CSS 會優先載入這個資料夾裡的 **LINE Seed TW（繁體中文版）** 字型；
若檔案不存在，會自動退回 Noto Sans TC，頁面仍正常顯示。

## 啟用 LINE Seed TW（選用）

1. 到官網 <https://seed.line.me> 免費下載「LINE Seed 繁體中文版」。
2. 將字型轉成 woff2（可用 fonttools 的 `woff2` 或線上轉檔工具）。
3. 依下列檔名放進這個資料夾，commit 後即自動生效：

   | 字重 | 檔名 |
   |------|------|
   | Regular (400) | `LINESeedTW_Rg.woff2` |
   | Bold (700)    | `LINESeedTW_Bd.woff2` |
   | ExtraBold (800) | `LINESeedTW_Eb.woff2` |

檔名需與 `index.html` 內 `@font-face` 的設定完全一致。
