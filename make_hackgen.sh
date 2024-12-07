#!/bin/bash

hackgen_version="2.9.1"

BASE_DIR=$(cd $(dirname $0); pwd)
PREFIX="$1"
SINGLE="$2" # 引数2: "single"でHackGen-Regular.ttfのみを作成する。出来を少し確認したいときに

function mvBuild() {
  mkdir -p "${BASE_DIR}/build/"
  rm -f "${BASE_DIR}/build/"*
  mv -f "${BASE_DIR}/"HakuMoto*.ttf "${BASE_DIR}/build/"
}

"${BASE_DIR}/hackgen_generator.sh" "$PREFIX" "$hackgen_version" "$SINGLE" \
&& "${BASE_DIR}/copyright.sh" "$PREFIX" \
&& "${BASE_DIR}/os2_patch.sh" "$PREFIX" \
&& "${BASE_DIR}/cmap_patch.sh" "$PREFIX" \
&& mvBuild

seconds=${SECONDS}
echo "build time: $((${seconds}/60))m $((${seconds}%60))s"
