#!/bin/sh

ar x runescape.deb

tar xf data.tar.xz

rm -f runescape.deb control.tar.gz data.tar.xz debian-binary _gpgbuilder

mv usr/share/games/runescape-launcher/runescape .

mv usr/bin/runescape-launcher .

sed -i 's|/usr/share/games/runescape-launcher/|/app/extra/|g' runescape-launcher

mkdir -p export/share/applications

sed -i 's|/usr/bin/runescape-launcher|runescape|g' usr/share/applications/runescape-launcher.desktop
sed -i 's|Categories=Game;|Categories=Game;\nStartupWMClass=RuneScape|g' usr/share/applications/runescape-launcher.desktop

sed s/Icon=runescape/Icon=com.jagex.RuneScape/ usr/share/applications/runescape-launcher.desktop > export/share/applications/com.jagex.RuneScape.desktop

mv usr/share/icons export/share/

for d in export/share/icons/hicolor/*; do
    mv $d/apps/runescape.png $d/apps/com.jagex.RuneScape.png
done

rm -rf usr
