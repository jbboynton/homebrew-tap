cask "ultimate-vocal-remover" do
  version "5.6"
  sha256 "3b3d925c0af0a3a72e44629db137240f4d22ac1e8b3156599c36164fffe55249"

  url "https://github.com/Anjok07/ultimatevocalremovergui/releases/download/v#{version}/Ultimate_Vocal_Remover_v#{version.dots_to_underscores}_MacOS_arm64.dmg"
  name "Ultimate Vocal Remover"
  desc "Removes vocals from audio files"
  homepage "https://github.com/Anjok07/ultimatevocalremovergui/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on :macos

  app "Ultimate Vocal Remover.app"

  # Upstream does not notarize the app, which is why homebrew/cask
  # disabled its own cask. Without this, macOS refuses to open the app
  # until it is approved by hand.
  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/Ultimate Vocal Remover.app"]
  end
end
