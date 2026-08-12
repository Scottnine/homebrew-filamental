cask "filamental" do
  version "0.3.31"
  sha256 "77babeac741a556e2437b3a6a2ade062631467492e6be11ffad237bb7bd5e218"

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
  depends_on macos: :catalina

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
