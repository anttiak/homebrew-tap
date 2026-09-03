cask "lofeline" do
  version "1.0.0"
  sha256 "3358e730dc3565f9ad5007bf96d6baeeb4745511494288c065033d387bb8a31d"

  url "https://github.com/anttiak/lofeline-macos/releases/download/v#{version}/LoFeline-#{version}.zip"
  name "LoFeline"
  desc "Tiny pixel cat that naps in your menu bar and plays lofi beats"
  homepage "https://github.com/anttiak/lofeline-macos"

  depends_on macos: :sonoma

  app "LoFeline.app"

  # The app isn't notarized, so clear Gatekeeper quarantine on install.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/LoFeline.app"]
  end

  zap trash: "~/Library/Preferences/io.github.anttiak.LoFeline.plist"
end
