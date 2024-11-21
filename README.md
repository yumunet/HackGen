# 白元（はくもと / HakuMoto）

[![GitHub Release](https://img.shields.io/github/v/release/yumunet/HakuMoto?style=for-the-badge&color=brightgreen)](https://github.com/yumunet/HakuMoto/releases)

白元（はくもと / HakuMoto）は、プログラミングフォント「[白源（はくげん / HackGen）](https://github.com/yuru7/HackGen)」のちょっとした改変版です。  
HakuMoto is a modified version of HackGen, a programming font.

**変更点は以下の3つ。**

* 縦線 `|` の破断線化を解除（U+007C）
* 全角丸括弧 `（`  `）` の文字単位での中央寄せを解除（U+FF08 / U+FF09）
* ゼロ `0` をドットゼロからスラッシュゼロに変更（U+0030）

ダウンロードは [Release](https://github.com/yumunet/HakuMoto/releases) からどうぞ！

## ビルド方法

Dockerfileとdocker-compose.ymlを用意しているので、Dockerで簡単にビルドできます。
また、makeコマンドでdockerコマンドを叩けるようにしています。

DockerとMakeをインストールし、以下のコマンドでDockerイメージを作成してください。

```
make build-image
```

あとは以下でビルドできます。

```
make build
```

zip作成は以下。

```
make pack
```

### ビルド環境

ツールのバージョンは、オリジナルのHackGenと揃えています。

* OS: Ubuntu 22.04 LTS (Docker)
* Tools
  * ttfautohint: 1.8.3
  * fonttools: 3.44.0
  * fontforge: 20201107

## ライセンス

SIL OPEN FONT LICENSE Version 1.1

詳細は[LICENSE](/LICENSE)を参照。不備があればお知らせください。
