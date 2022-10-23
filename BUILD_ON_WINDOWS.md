Windows 10 以降で、HackGenをビルドする方法です。

※コード内の【】で囲んでいる部分は、その指示通りの文字列に置き換えてください。


## 1. Windows Subsystem for Linux (WSL) をインストール

WindowsでLinuxを動かすやつ。

1. 管理者権限で実行したコマンドプロンプトまたはPowerShellで、下記コマンドを実行する
```
wsl --install
```
2. PCを再起動
3. 「Ubuntu 20.04 on Windows」がインストールされているはずので、スタートメニューなどから起動する
4. Ubuntu起動後の案内にそって、ユーザー名とパスワードを設定する（この後も使うので必ず覚えておいてください）
5. Ubuntuで下記コマンドを実行し、パッケージの更新とアップグレードをする（**自動的には行われないので、定期的に手動で実行してください**）
```
sudo apt update && sudo apt upgrade
```
※`sudo`はスーパーユーザー権限（Windowsでいう管理者権限）でコマンドを実行するもので、手順2で設定したパスワードを入力する必要があります。入力中のパスワードは表示されませんが、入力自体はできてるのでEnterで決定してください。

Ubuntuを日本語化したい場合はこちら: [WSLのUbuntu環境を日本語化する：Tech TIPS - ＠IT](https://atmarkit.itmedia.co.jp/ait/articles/1806/28/news043.html)


## 2. Ubuntuにビルドツールをインストール

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
1. [Releases · fontforge/fontforge (GitHub)](https://github.com/fontforge/fontforge/releases) からHackGenのビルド環境に合わせて「FontForge 2020 March Release」の「FontForge-2020-03-14-67687b0-x86_64.AppImage」ファイルをダウンロード
2. ダウンロードした.AppImageファイルを展開（※[パスについて](#パスについて)）
```
cd 【.AppImageがあるディレクトリのパス】
./FontForge-2020-03-14-67687b0-x86_64.AppImage --appimage-extract
```
3. カレントディレクトリに生成された `squashfs-root\usr\bin` ディレクトリの絶対パスを、Windowsの環境変数 `Path` に追加する
4. Windowsの環境変数を再読み込みさせるため、Ubuntuを再起動


## 3. ソースコードをダウンロード

### GitHubから直接ダウンロードする場合
このリポジトリのページ右上にある緑色の「Code」ボタンから「Download ZIP」を押して.zipファイルをダウンロードし、すべて展開する。

### Gitを使う場合
下記コマンドを実行する。
※ファイルの改行コードが勝手に LF から CRLF に変換されてビルドできなくなってしまわないよう、`core.autocrlf` 設定を `false` にする。
```
git config --global core.autocrlf false
git clone https://github.com/yumunet/HackGen-Y
```

### 3-1. ソースコードをUbuntuのディレクトリに置く
普通にWindowsのディレクトリに置いても構いませんが、Ubuntuのディレクトリに置いた方がビルドが高速化します。
※自分の環境では [ad596c7](https://github.com/yumunet/HackGen-Y/commit/ad596c73bb11ef24cdf8087ad6972d4b64f449e2) 時点でビルド時間が Windows 12分13秒、Ubuntu 8分27秒 だったので約1.3倍の高速化。

1. `\\wsl$\Ubuntu-20.04\home\【Ubuntuのユーザー名】` のディレクトリをエクスプローラーのアドレスバーなどに入力して開く
2. そこにソースコードをディレクトリ丸ごと置く
3. .shファイルに実行権限を付与する（これをしないとビルドのスクリプトが実行できない） ※[パスについて](#パスについて)
```
cd 【ソースコードのディレクトリパス】
chmod u+x *.sh
```
ファイル・ディレクトリのアクセス権限については、こちらが分かりやすくてオススメ: [Linuxの権限確認と変更(chmod)（超初心者向け） - Qiita](https://qiita.com/shisama/items/5f4c4fa768642aad9e06)

※.shファイルは、メモ帳など普通のWindowsソフトで編集・保存すると実行権限が消えるようなので注意。拡張機能「[WSL](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-wsl)」を入れたVS Codeなどだと実行権限が消えない。


## 4. ビルド

Ubuntuで `make_hackgen.sh` を実行する。
※[パスについて](#パスについて)
```
cd 【ソースコードのディレクトリパス】
./make_hackgen.sh
```


## パスについて

- 区切り文字は、`\`（バックスラッシュ, Windowsでは円マークとも呼ぶ）ではなく、`/`（スラッシュ）
- Windowsのディレクトリにアクセスする場合は、`/mnt/【ドライブ名(小文字)】/【残りのディレクトリパス】`と書く（例: `C:\Users` -> `/mnt/c/Users`）
- Ubuntu自身のディレクトリにアクセスする場合は、Windowsから見た `\\wsl$\Ubuntu-20.04` がルートディレクトリで、`/home` などと書く。`/home/【Ubuntuのユーザー名】` は `~` とも書ける
