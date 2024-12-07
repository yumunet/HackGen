# 白元（はくもと / HakuMoto）

[![GitHub Release](https://img.shields.io/github/v/release/yumunet/HakuMoto?style=for-the-badge&color=brightgreen)](https://github.com/yumunet/HakuMoto/releases)

白元（はくもと / HakuMoto）は、プログラミングフォント「[白源（はくげん / HackGen）](https://github.com/yuru7/HackGen)」のちょっとした改変版です。  
HakuMoto is a modified version of the programming font HackGen.

**変更点は以下。**

* ゼロ `0` をドットゼロからスラッシュゼロに変更（U+0030）
* 縦線 `|` の破断線化を解除（U+007C）
* 全角スペース `　` の可視化を解除（U+3000）
* 全角丸括弧 `（`  `）` の文字単位での中央寄せを解除（U+FF08 / U+FF09）

|HackGen|HakuMoto|
|-|-|
|![HackGen](https://github.com/user-attachments/assets/b82b884f-7fea-478c-92b8-39106824e987)|![HakuMoto](https://github.com/user-attachments/assets/94955d6e-9007-4e23-bf5c-b17f902ff43d)|

ダウンロードは [Releases](https://github.com/yumunet/HakuMoto/releases) からどうぞ！

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
