cask "sleekvoice" do
  version "2.3"
  sha256 "d015afe72c8f15eaf2627fbaf42dc51eb82ea4cad1965f018f7a1a0539b8776e"

  url "https://github.com/bvsbharat/SleekVoice/releases/download/v#{version}/SleekVoice-#{version}.dmg"
  name "SleekVoice"
  desc "Voice-to-text AI that turns speech into clear, polished writing"
  homepage "https://github.com/bvsbharat/SleekVoice"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "SleekVoice.app"

  zap trash: [
    "~/Library/Application Support/com.bharatbvs.SleekVoice",
    "~/Library/Preferences/com.bharatbvs.SleekVoice.plist",
    "~/Library/Caches/com.bharatbvs.SleekVoice",
    "~/Library/Saved Application State/com.bharatbvs.SleekVoice.savedState",
  ]
end
