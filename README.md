# HakuMoto（はくもと / 白元）

### 変更点
* 縦線 (パイプ記号) `|` (U+007C) の破断線化を解除
* 全角丸括弧 `（` (U+FF08) `）` (U+FF09) の文字単位での中央寄せを解除　※開きを右寄せ、閉じを左寄せに
* ゼロ `0` (U+0030) をドットゼロではなくスラッシュゼロに

### ビルド環境
* OS: Ubuntu 22.04 LTS (Docker+WSL)
* Tools
  * ttfautohint: 1.8.3
  * fonttools: 3.44.0
  * fontforge: 20201107

[Windowsでの環境構築からビルドまでの方法](/BUILD_ON_WINDOWS.md)
