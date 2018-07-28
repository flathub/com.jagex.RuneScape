# Contributing to the RuneScape Flatpak

Welcome to the RuneScape flatpak project.
This is a community maintained package for RuneScape.
We are not affiliated with Jagex or their game in any way.

## Useful Extra Info

[Buildbot](https://flathub.org/builds/#/) provides a list of recent builds on flathub. Use this and find `com.jagex.RuneScape` in the list to see when the last build occured in a visual way.
If buildbot isn't showing anything, you can reference the [api itself](https://flathub.org/builds/api/v2/builders/2/builds?limit=200&order=-started_at&state_string__contains=RuneScape&property=owners&property=workername&property=flathub-arches&property=flathub-build-id&property=flathub-official-build&property=repository) to find the recent builds. This information is more difficult to parse, primary concerns are `state_string` for the status and `started_at` for the build time.

If you want to know what version you are running locally you can run `flatpak info com.jagex.RuneScape` and check the output for the git commit hash.

To see where the build on Flathub is at run `flatpak remote-info flathub com.jagex.RuneScape` and look for the same info as before.

## Quick Steps

1. Install `flatpak-builder`
1. Clone the repository and cd into it.
1. Build to a local repository: `flatpak-builder --state-dir=tmp/flatpak-builder --force-clean --repo=tmp/repo tmp/runescape com.jagex.RuneScape.json`
1. Add your local repository to your list in flatpak: `flatpak --user remote-add runescape-local --no-gpg-verify tmp/repo`
1. Install the game from your local repository: `flatpak --user install runescape-local com.jagex.RuneScape`

And as the manifest gets updated run the following to update your flatpak locally.

`flatpak --user update -y com.jagex.RuneScape`

## Detailed guidelines

TODO
