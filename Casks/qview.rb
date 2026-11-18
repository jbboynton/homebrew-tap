cask "qview" do
  version "7.1"
  sha256 "fa34d0e54601b8557f4e879527b9bb1e728ace5c7c1c69cf126700ca4d0b5817"

  url "https://github.com/jurplel/qView/releases/download/#{version}/qView-#{version}.dmg"
  name "qView"
  desc "Image viewer"
  homepage "https://github.com/jurplel/qView/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "qView.app"

  # Upstream does not notarize the app, which is why homebrew/cask
  # disabled its own cask. Without this, macOS refuses to open the app
  # until it is approved by hand.
  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/qView.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.interversehq.qview.sfl*",
    "~/Library/Preferences/com.interversehq.qView.plist",
    "~/Library/Preferences/com.qview.qView.plist",
    "~/Library/Saved Application State/com.interversehq.qView.savedState",
  ]
end
