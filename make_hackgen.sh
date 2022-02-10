#!/bin/bash

BASE_DIR=$(cd $(dirname $0); pwd)
PREFIX="$1"

function mvBuild() {
  mkdir -p "${BASE_DIR}/build/"
  mv -f "${BASE_DIR}/"HackGen*.ttf "${BASE_DIR}/build/"
}

"${BASE_DIR}/hackgen_generator.sh" "$PREFIX" \
&& "${BASE_DIR}/os2_patch.sh" "$PREFIX" \
&& mvBuild

seconds=${SECONDS}
echo "build time: $((${seconds}/60))m $((${seconds}%60))s"
