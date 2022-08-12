Windows 10 以降 で HackGen をビルドする方法です。


## 1. Windows Subsystem for Linux (WSL) をインストール

Windows で Linux を動かすやつ。

1. 管理者権限で実行したコマンドプロンプトまたはPowerShellで、下記コマンドを実行する
```
wsl --install
```
2. PCを再起動
3. 「Ubuntu 20.04 on Windows」がインストールされているはずので、スタートメニューなどから起動する
4. Ubuntu 起動後の案内にそって、ユーザー名とパスワードを設定する（この後も使うので必ず覚えておいてください）
5. Ubuntu で下記コマンドを実行し、パッケージの更新とアップグレードをする（ **自動的には行われないので、定期的に手動で実行してください** ）
```
sudo apt update && sudo apt upgrade
```
※`sudo`はスーパーユーザー権限（Windows でいう管理者権限）でコマンドを実行するもので、手順2で設定したパスワードを入力する必要があります。入力中のパスワードは表示されませんが、入力自体はできてるのでEnterで決定してください

Ubuntu を日本語化したい場合はこちら: [WSLのUbuntu環境を日本語化する：Tech TIPS - ＠IT](https://atmarkit.itmedia.co.jp/ait/articles/1806/28/news043.html)

※すでに「WSL1」を使っている場合は、[WSL のインストール | Microsoft Docs](https://docs.microsoft.com/ja-jp/windows/wsl/install#upgrade-version-from-wsl-1-to-wsl-2) にそって「WSL2」にアップグレードすることを推奨。
これにより自分の環境ではビルドが3倍以上高速化しました（WSL1,2ともにソースコードをUbuntuのディレクトリに置いた場合）。


## 以降は、主にこの Ubuntu のシェルにコマンドを打って作業を進める
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
1. [Releases · fontforge/fontforge · GitHub](https://github.com/fontforge/fontforge/releases) から .AppImage ファイルをダウンロード（HackGen のビルド環境に合わせて「2020 March Release」（2020-03-14）の古いバージョンをダウンロードする）
2. ダウンロードした .AppImage ファイルを展開（※[パスについて](#パスについて)）
```
cd 【.AppImageがあるディレクトリのパス】
./【.AppImageの名前】 --appimage-extract
```
3. その .AppImage ファイルと同じ場所に生成された `squashfs-root\usr\bin` ディレクトリの絶対パスを、Windows の環境変数 `Path` に追加する
4. 環境変数 Path を再読み込みさせるため、Ubuntu を再起動

※ちなみに、[Design With FontForge: Installing FontForge](http://designwithfontforge.com/en-US/Installing_Fontforge.html) にそって、下記のように `apt-get` でインストールしたところ、2019-05-26 リリースの古いものがインストールされた。おそらく開発側がこの配布方法をやめ、.AppImage ファイルで配布するようにしたためだと思われる。
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

### ソースコードを Ubuntu のディレクトリに置く
普通に Windows のディレクトリに置いても構いませんが、Ubuntu のディレクトリに置いた方がビルドが高速化します。
※自分の環境では [ad596c7](https://github.com/yumunet/HackGen-Y/commit/ad596c73bb11ef24cdf8087ad6972d4b64f449e2) の時点でビルド時間が、Windowsディレクトリで12分13秒、Ubuntuディレクトリで8分27秒だったので、約1.3倍の高速化。

1. `\\wsl$\Ubuntu-20.04\home\【Ubuntuのユーザー名】` のディレクトリをエクスプローラーのアドレスバーなどに入力して開く
2. そこにソースコードをディレクトリごと置く
3. .sh ファイルに実行権限を付与する（これをしないとビルドスクリプトが実行できません） ※[パスについて](#パスについて)
```
cd 【ソースコードのディレクトリパス】
chmod u+x *.sh
```
ファイル・ディレクトリのアクセス権限については、こちらが分かりやすくてオススメ: [Linuxの権限確認と変更(chmod)（超初心者向け） - Qiita](https://qiita.com/shisama/items/5f4c4fa768642aad9e06)

※.sh ファイルは、普通の Windows ソフト（メモ帳など）で編集・保存するとなぜか実行権限が消えるので注意。拡張機能「Remote - WSL」を入れた VS Code などだと実行権限が消えない。


## 4. ビルド

make_hackgen.sh を実行する。
※[パスについて](#パスについて)
```
cd 【ソースコードのディレクトリパス】
./make_hackgen.sh
```


## パスについて

- 区切り文字は、`\` (バックスラッシュ, 円マークとも呼ぶ) ではなく、`/` (スラッシュ)
- Windows のディレクトリにアクセスする場合は、`/mnt/【ドライブ名(小文字)】/【残りのディレクトリパス】`というように書く（例: `C:\Users` -> `/mnt/c/Users`）
- Ubuntu のディレクトリは、Windows から見た `\\wsl$\Ubuntu-20.04` がルートディレクトリで、`/home` などと書く。`/home/【Ubuntuのユーザー名】` は `~` とも書ける
