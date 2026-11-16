cask "overtone" do
  version "1.1.0"
  sha256 "cef477b41d3cf3a4ae8fcd40b70c672bce485824f5f343b69957529a49cf08f3"

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
