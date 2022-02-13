# フォーク内容

## 変更点
* パイプ `|` の破断線化を解除
* 全角丸括弧 `（` `）` の文字単位での中央寄せを解除　※開きを右寄せ、閉じを左寄せに

## ビルド環境
* OS: Ubuntu 20.04.3 LTS (WSL)
* Tools
  * ttfautohint: 1.8.3
  * fonttools: 3.44.0
  * fontforge: 20201107

[Windowsでの環境構築からビルドまでの方法](/BUILD_ON_WINDOWS.md)

<br/>

# プログラミングフォント 白源 (はくげん／HackGen)

HackGen is a composite font of Hack and GenJyuu-Gothic.

白源 (はくげん／HackGen) は、プログラミング向け英文フォント Hack と、源ノ角ゴシックの派生フォント源柔ゴシックを合成したプログラミングフォントです。  

2つのフォントをただ合成しただけではなく、一部の独自改変により更なる視認性向上を図っています。

特徴などの詳しい説明は以下の記事を参照してください。  
**[Ricty を神フォントだと崇める僕が、フリーライセンスのプログラミングフォント「白源」を作った話](https://qiita.com/tawara_/items/374f3ca0a386fab8b305)**

> 💡 その他、公開中のプログラミングフォント
> - 日本語文字に源真ゴシック、英数字部分に Fira Mono を使った [**Firge (ファージ)**](https://github.com/yuru7/Firge)
> - 日本語文字に IBM Plex Mono、英数字部分に IBM Plex Sans JP を使った [**PlemolJP (プレモル ジェイピー)**](https://github.com/yuru7/PlemolJP)

|**白源 通常版**|**白源 半角3:全角5 版**|
|:------------------------:|:------------------------:|
|![hackgen](https://user-images.githubusercontent.com/13458509/133928601-cb1d3e00-6c4b-4ce5-a945-44ae2baa81e0.png)|![hackgen35](https://user-images.githubusercontent.com/13458509/133928624-77ed3d0b-8e6c-46c1-89e1-3e85f6d0c215.png)|

## フォントファミリーの種類

**※いずれのフォントにも Powerline 記号が含まれています。**

|**フォント ファミリー**|**説明**|
|:------------:|:---|
|**HackGen**|文字幅比率「半角1:全角2」の通常版の白源。主にASCIIコードの英数字記号に Hack ベースの字体を使い、その他の記号類やかな文字・漢字を源柔ゴシックベースにしている|
|**HackGen Console**|Hack ベースの字体を除外せずに全て適用したフォントファミリー。矢印記号などの多くの記号が半角で表示されるため、コンソールでの利用や記号類は可能な限り半角で表示したい人にオススメ|
|**HackGen35**|通常版の白源の文字幅比率を「半角3:全角5」にしたフォントファミリー。英数字が通常版の白源よりも大きく表示される。日本語が少ない文書やコードの場合にはこちらの方が読みやすいと感じるかもしれない|
|**HackGen35 Console**|HackGen Console  の文字幅比率を 半角3:全角5 にしたフォントファミリー|

|**HackGen 系統**|**HackGen35 系統**|
|:---:|:---:|
|`HackGen`<br/>![hackgen](https://github.com/yuru7/HackGen/raw/image/hikaku_hackgen.png)|`HackGen35`<br/>![hackgen35](https://github.com/yuru7/HackGen/raw/image/hikaku_hackgen35.png)|
|`HackGen Console`<br/>![hackgen console](https://github.com/yuru7/HackGen/raw/image/hikaku_hackgen-console.png)|`HackGen35 Console`<br/>![hackgen35 console](https://github.com/yuru7/HackGen/raw/image/hikaku_hackgen35-console.png)|

また、追加で提供している `HackGenNerd` `HackGen35Nerd` フォントファミリーには、[Nerd Fonts](https://www.nerdfonts.com/) を追加合成しており、Font Awesome をはじめとした多くのアイコンフォントが表示できるようになります。  
> ⚠ Nerd Fonts の仕様 ([Fix invalid code points for some glyphs](https://github.com/ryanoasis/nerd-fonts/issues/365)) により、一部のコードポイントにおいて漢字グリフが Nerd Fonts 収録グリフに置き換わっています。(例: `﨑 (たつさき/U+FA11)` など) Nerd Fonts を必要とする用途以外は、通常の HackGen を利用することをオススメします。

## フォントのインストール

ビルド済みの ttf ファイルは GitHub のリリースページからダウンロードできます。  
ダウンロードした ttf ファイルは、各 OS に応じた手順でインストールしてください。

[Release - HackGen](https://github.com/yuru7/HackGen/releases)

* `HackGen_バージョン.zip` は従来の HackGen/HackGen35
* `HackGenNerd_バージョン.zip` は従来の HackGen/HackGen35 に [Nerd Fonts](https://www.nerdfonts.com/) を追加合成したもの

### Homebrew によるフォントのインストール

Mac の Homebrew ユーザーは以下のコマンドでもインストールすることができます。  
※Homebrew リポジトリに追加してくださったのはユーザーさんなので、使用方法などをリポジトリオーナーはサポートできません。悪しからずご了承ください。

```
$ brew tap homebrew/cask-fonts
$ brew install font-hackgen
$ brew install font-hackgen-nerd
```

### Chocolatey によるフォントのインストール

Windows の [Chocolatey](https://chocolatey.org/) ユーザーは以下のコマンドでもインストールすることができます。  
[font-hackgen](https://chocolatey.org/packages/font-hackgen) が Nerd Fonts を含まないフォント、[font-hackgen-nerd](https://chocolatey.org/packages/font-hackgen-nerd) が Nerd Fonts を含むフォントです。  
※インストールに失敗する場合は、[パッケージのリポジトリ](https://github.com/kai2nenobu/chocolatey-packages/)にissueを投稿してください。

```
> choco install font-hackgen
> choco install font-hackgen-nerd
```

## ビルド環境

HackGen は以下の環境でビルドしています。

* OS: Ubuntu 20.04.2 (Kubuntu)
* Tools
  * ttfautohint: 1.8.3
  * fonttools: 3.44.0
  * fontforge: 20201107

### ビルドツールのインストール方法と注意点

* ttfautohint: `sudo apt install ttfautohint`
* fonttools: Python 2 の pip で `sudo pip2 install fonttools`
  * fonttools に含まれるサブツール `pyftmerge` と `ttx` をコマンドとして利用しているため、`sudo` を使ってシステム全体で使えるようにする
  * Python 3 の pip を使ったものは fonttools 4.13.0 がインストールされる (2020/08/01 時点)。 fonttools 4.13.0 では post テーブルの構造が変わってしまうため、macOS 10.15 にてインストール不可となる ([#12](https://github.com/yuru7/HackGen/issues/12))
* fontforge: [公式サイト](https://fontforge.org/en-US/downloads/) よりダウンロード
