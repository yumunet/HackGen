Windows 10 以降 で HackGen をビルドする方法です。


## 1. Windows Subsystem for Linux (WSL) をインストール

Windows で Linux を動かすやつ。
1. コントロールパネル > プログラム > Windows の機能の有効化または無効化 を開く
2. 「Linux 用 Windows サブシステム」にチェックを入れてOK
3. PCを再起動
4. Microsoft Store を開き「Ubuntu 20.04 LTS」をインストールする

インストール後、Ubuntu を起動する。

## 以降は、主に Ubuntu のシェルにコマンドを打って作業を進める
なにかコードが出てきたら、そのままシェルに打ち込むものと思ってください。
ただし、【】で囲んでいる部分は、その指示通りの文字列に置き換えてから打ち込んでください。


## 2. ビルドツールをインストール

### ttfautohint
1. 本体をインストールするだけ
```
sudo apt install ttfautohint
```

### fonttools
※バージョン 3.44.0 をインストールするため、Python 2 の pip でインストールする。

1. Python 2 をインストール
```
sudo apt install python2
```

2. Python 2 の pip をインストール（参考: [Python 2.7 に pip をインストールする - Qiita](https://qiita.com/sg0hsmt/items/f8fc8d587bff816654a8)）
```
curl https://bootstrap.pypa.io/pip/2.7/get-pip.py -o get-pip.py
sudo python2 get-pip.py
```

3. 本体インストール
```
sudo pip2 install fonttools
```

### fontforge
1. [Releases · fontforge/fontforge (GitHub)](https://github.com/fontforge/fontforge/releases) から .AppImage ファイルをダウンロード
2. ダウンロードした .AppImage ファイルを展開（※[パスについて](#パスについて)）
```
cd 【.AppImageがあるフォルダのパス】
./【.AppImageの名前】 --appimage-extract
```
3. その .AppImage ファイルと同じ場所に生成された `squashfs-root\usr\bin` フォルダの絶対パスを、Windows の環境変数 `Path` に追加する
4. 環境変数 Path を再読み込みさせるため、Ubuntu を再起動

※ちなみに、[Design With FontForge: Installing FontForge](http://designwithfontforge.com/en-US/Installing_Fontforge.html) に沿って、下記のように `apt-get` でインストールしたところ、2019-05-26 リリースの古いものがインストールされた。おそらく開発側がこの配布方法をやめ、.AppImage ファイルで配布するようにしたためだろう。
```
sudo add-apt-repository ppa:fontforge/fontforge
sudo apt-get update
sudo apt-get install fontforge
```


## 3. ソースコードをダウンロード

### GitHub から直接の場合
このリポジトリのページ右上にある緑色の Code > Download ZIP で直接ダウンロードする。

### Git を使う場合
※cloneする前に、Git の `core.autocrlf` 設定を、`input` か `false` にしておくこと。そうしないとファイルの改行コードが勝手に LF から CRLF に変換され、うまくビルドできなくなってしまう。
```
git clone https://github.com/yumunet/HackGen-Y
```


## 4. ビルド

make_hackgen.sh を実行する。
※[パスについて](#パスについて)
```
cd 【ソースがあるフォルダのパス】
./make_hackgen.sh
```


## パスについて

- 区切り文字は、`\` (円マーク, バックスラッシュ) ではなく、`/` (スラッシュ)
- Windows のフォルダにアクセスする場合は、`/mnt/【ドライブ名(小文字)】/【フォルダパス(ドライブ名含めない)】`というように書く（例: `C:\Users` -> `/mnt/c/Users`）
