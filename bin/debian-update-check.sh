#!/usr/bin/env bash

if ! which curl > /dev/null; then
  echo "Curl is required to check for an updated build."
  exit 1
fi

outputLocation="/tmp/rs.deb"

curl -sL -o $outputLocation "https://content.runescape.com/downloads/ubuntu/pool/non-free/r/runescape-launcher/runescape-launcher_2.2.5_amd64.deb"

echo "The current file size is: $(wc -c < $outputLocation)"
echo "The current sha256sum is: $(sha256sum $outputLocation | cut -d " " -f 1)"

rm $outputLocation
