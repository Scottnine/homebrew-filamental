cask "filamental" do
  version "0.3.48"
  sha256 "79a9416c33fff531b8446f9e69de37ebf2a06fc8d3dd09b1c07804c0992fafc5"

  url "https://github.com/Scottnine/filamental/releases/download/v#{version}/Filamental_#{version}_universal.dmg",
      verified: "github.com/Scottnine/filamental/"
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
  # Filamental itself runs on macOS 10.15 and up, which is what this said until
  # 2026-09-16. Homebrew DISABLED the :catalina symbol when it dropped support
  # for that macOS, so the cask stopped auditing and every release from 0.3.44
  # to 0.3.48 failed the tap's own test workflow while the releases themselves
  # were fine. Nothing here changed to cause it; Homebrew moved underneath us.
  #
  # The syntax is not the problem and does not need replacing: :monterey and
  # :ventura are in wide use. Only the symbol for a macOS Homebrew no longer
  # supports is refused. So this is now the oldest one Homebrew still accepts,
  # which overstates the real requirement slightly and is the closest it can be
  # expressed. When Big Sur goes the same way, move it up again.
  depends_on macos: :big_sur

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
