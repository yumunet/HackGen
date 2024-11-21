#!/bin/bash

# スクリプトからバージョン抽出
hackgen_version=$(sed -n -E "/^hackgen_version=\".*?\"/p" make_hackgen.sh | sed -E "s/^.+=\"(.*?)\"/\1/")
additional_version=$(sed -n -E "/^additional_version=\".*?\"/p" hackgen_generator.sh | sed -E "s/^.+=\"(.*?)\"/\1/")
version="v$hackgen_version+$additional_version"
normal_name="HakuMoto_$version"
nerdfonts_name="HakuMoto_NF_$version"
licenses_dir="LICENSES"

function copyLicenses() {
  dest_dir=$1
  mkdir -p "$dest_dir"
  cp ./source/LICENSE_* "$dest_dir"
  cp ./LICENSE_HackGen "$dest_dir"
}

echo "pack"

if [ -z "$(ls ./build)" ]
then
  echo "Not exist build files"
  exit
fi

# 一時ディレクトリにファイルをコピーしてディレクトリ構造を作り、7zで圧縮する
tmpdir=$(mktemp -d /tmp/XXXXXXXXXX)
trap 'rm -rf ${tmpdir}' EXIT
normal_dir="$tmpdir/$normal_name"
nerdfonts_dir="$tmpdir/$nerdfonts_name"

copyLicenses "$normal_dir/$licenses_dir"
rm "$normal_dir/$licenses_dir/LICENSE_NerdFonts" # 通常版にNerdFontsは入っていないのでライセンスを除外
copyLicenses "$nerdfonts_dir/$licenses_dir"
find ./build/*.ttf | while read -r filename
do
  if [[ "$filename" =~ "NF" ]]; then
    cp "$filename" "$nerdfonts_dir"
  else
    cp "$filename" "$normal_dir"
  fi
done

7zz a -mx9 -mfb=258 -mpass15 "$tmpdir/$normal_name.zip" "$normal_dir" \
  && mv -f "$tmpdir/$normal_name.zip" ./build
7zz a -mx9 -mfb=258 -mpass15 "$tmpdir/$nerdfonts_name.zip" "$nerdfonts_dir" \
  && mv -f "$tmpdir/$nerdfonts_name.zip" ./build
