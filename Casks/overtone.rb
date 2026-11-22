cask "overtone" do
  version "1.1.1"
  sha256 "ac19da1b0c97f1e8462ebf7d2cbca8aa7da97bfa118f8071ea8cf54f8efae365"

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
  EOS
end
