cask "overtone" do
  version "1.0.1"
  sha256 "a4c3a146e12da5cf8319d5c08701a17e9776ccd0ca56a036564955befdeca8eb"

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
