cask "overtone" do
  version "1.0.0"
  sha256 "464e388d18fbbcddc39b58e6f98666556ea3b938cbad3bbd3019bff918facedb"

  url "https://github.com/TobiasPol/overtone/releases/download/v#{version}/Overtone-#{version}.zip"
  name "Overtone"
  desc "Menu bar system-wide equalizer with AutoEQ, spatial audio and per-app volume"
  homepage "https://github.com/TobiasPol/overtone"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Overtone.app"

  uninstall quit: "com.tobiaspol.overtone"

  zap trash: "~/Library/Application Support/Overtone"

  caveats <<~EOS
    Overtone lives in the menu bar (no Dock icon). On first launch, allow
    "System Audio Recording" when macOS asks.

    Releases are not notarized yet, so macOS blocks the very first launch.
    Open System Settings → Privacy & Security and click "Open Anyway",
    or clear the download quarantine yourself:
      xattr -dr com.apple.quarantine "#{appdir}/Overtone.app"
  EOS
end
