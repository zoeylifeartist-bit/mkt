#!/bin/bash
# Run this script in the zoey-website folder to download all images from Manus
# Usage: bash download-images.sh

mkdir -p images
cd images

BASE="https://zoeyfolio-aymrgrp9.manus.space/images"

for img in \
  hero-zoey.jpg hbr-logo.png columbia-logo.png logo-microsoft.png \
  bytedance-logo.png tencent-logo.png alibaba-com.png \
  ckgsb-1.jpg ckgsb-2.jpg ckgsb-3.jpg tiktok-shop.png \
  pico-1.jpg pico-2.jpg rednote-profile.jpg wechat-profile.jpg \
  linkedin-profile.jpg pic20-hot-video.jpg \
  hbr-1.png hbr-2.png hbr-3.png \
  events-1.png events-2.png events-3.png
do
  echo "Downloading $img..."
  curl -sL "$BASE/$img" -o "$img"
  if [ -s "$img" ]; then
    echo "  OK ($(wc -c < "$img") bytes)"
  else
    echo "  FAILED - try opening $BASE/$img in browser and Save As"
  fi
done

echo ""
echo "Done! All images saved to ./images/"
