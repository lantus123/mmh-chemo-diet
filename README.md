# 化學治療期間飲食照顧指南

馬偕兒童醫院　十一病房　衛教單張（單頁靜態網站）。

## 線上網址（GitHub Pages）

<https://lantus123.github.io/mmh-chemo-diet/>

> push 到 `main` 後，GitHub Pages 約 1–2 分鐘自動更新。

## 嵌入 Google Sites 的方法

新版 Google Sites 沒有開放編輯 API，採「嵌入 GitHub Pages 網址」的方式：

1. 進入要編輯的 Google Sites → 右側 **插入（Insert）** → **內嵌（Embed）**
2. 切到 **嵌入程式碼（Embed code）** 分頁，貼上：

   ```html
   <iframe src="https://lantus123.github.io/mmh-chemo-diet/"
           style="width:100%; height:7700px; border:0;"
           loading="lazy" title="化學治療期間飲食照顧指南"></iframe>
   ```

3. 按 **下一步 → 插入**，再把內嵌框拖到滿版寬度。
4. 右上 **發布（Publish）**。

調整高度（實測值，內容會隨寬度變化、`height` 是固定值）：
- 桌機寬度內容約 **6800px**、手機寬度約 **7700px**。
- 預設用 **7700px**：手機不會被切，桌機底部會多一小段留白（無害）。
- 只在意桌機可改 **6800px**：桌機剛好，但手機底部會出現內捲軸。
- 醫療內容建議寧可留白、不要切掉「禁食清單」等段落。

替代做法：插入 → 內嵌 → **依網址（By URL）**，貼上同一個網址後直接在編輯器裡拖拉高度，不必算數字。

## 字型

頁面優先使用 **LINE Seed TW（繁體中文版）**，找不到時自動退回 Noto Sans TC（已從 Google Fonts 載入），顯示正常。
若要啟用 LINE Seed TW，請見 [`fonts/README.md`](fonts/README.md)。

## 本機預覽

```bash
cd ~/projects/mmh-chemo-diet
python3 -m http.server 8080
# 瀏覽器開 http://localhost:8080
```
