# Filamental Homebrew Tap

Official Homebrew tap for [Filamental](https://filamental.space), a desktop app that turns a
folder of markdown notes into a 3D knowledge graph you can fly through, arrange and publish.

## Install

```sh
brew install --cask scottnine/filamental/filamental
```

That one command taps this repository and installs the app in a single step. If you would rather
tap first:

```sh
brew tap scottnine/filamental
brew install --cask filamental
```

## Upgrade

Filamental has a built in updater, so the app keeps itself current and the cask is marked
`auto_updates`. Homebrew therefore leaves it alone during a normal `brew upgrade`. To force
Homebrew to reinstall the latest release anyway:

```sh
brew upgrade --cask --greedy filamental
```

## Uninstall

```sh
brew uninstall --cask filamental
```

To also remove settings, licence state and the per vault search indexes:

```sh
brew uninstall --zap --cask filamental
```

Your notes are never touched by either command. Filamental stores nothing inside your vault
except a `.filamental` folder for spatial positions, and your markdown files stay exactly where
you put them.

## What gets installed

A universal build covering both Apple silicon and Intel, signed and notarized with an Apple
Developer ID. The DMG is the same artifact published on the
[GitHub releases page](https://github.com/Scottnine/filamental/releases).

## Other platforms

| Platform | Install |
|---|---|
| Windows | `winget install Filamental.Filamental` or `choco install filamental`, or the Microsoft Store |
| Linux | `.deb`, `.rpm` and AppImage on the [releases page](https://github.com/Scottnine/filamental/releases) |

## Support

Issues with the app itself belong on [filamental.space](https://filamental.space). Issues with
this tap, meaning the install or upgrade path rather than the app, can be raised here.
