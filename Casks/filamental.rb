cask "filamental" do
  version "0.3.50"
  sha256 "0990aa9223a90dbdfec9221f6009fd534946d21b00949e678a71d281f55bd194"

  # No `verified:` here. It was deprecated in the same Homebrew that disabled
  # :catalina, and the audit says to rely on the default URL verification. Fixed
  # pre-emptively: a deprecation in this tap becomes a hard error later, and this
  # workflow is the only thing that watches the cask, so it goes red on a release
  # and stays red. That is exactly how :catalina cost five releases.
  url "https://github.com/Scottnine/filamental/releases/download/v#{version}/Filamental_#{version}_universal.dmg"
  name "Filamental"
  desc "Turn a folder of markdown notes into a 3D knowledge graph"
  homepage "https://filamental.space/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Filamental ships its own updater, which checks api.filamental.space and
  # replaces the app in place. Marking the cask auto_updates keeps `brew
  # upgrade` from fighting it: brew will leave the cask alone unless the user
  # explicitly passes --greedy.
  auto_updates true
  # Filamental itself runs on macOS 10.15 and up, older than anything Homebrew
  # still supports, so the cask asks only for macOS. Naming a minimum is now an
  # audit error when it is no newer than Homebrew's own floor (OSDependsOn,
  # 2026-09-29), just as naming a macOS Homebrew had dropped was (:catalina,
  # 2026-09-16). Do NOT move this up to a newer named version to satisfy a
  # future audit: that would shut out Macs the app runs on. Name a version here
  # only if the app itself ever needs one newer than Homebrew's floor.
  depends_on :macos

  app "Filamental.app"

  # Vaults are plain markdown folders the user chose themselves and are never
  # touched here. Everything below lives under the app's own bundle identifier:
  # licence and registration state, per-vault SQLite indexes, user settings,
  # the extracted help world, and the usual macOS per-app caches.
  zap trash: [
    "~/Library/Application Support/com.filamental.app",
    "~/Library/Caches/com.filamental.app",
    "~/Library/HTTPStorages/com.filamental.app",
    "~/Library/Preferences/com.filamental.app.plist",
    "~/Library/Saved Application State/com.filamental.app.savedState",
    "~/Library/WebKit/com.filamental.app",
  ]
end
