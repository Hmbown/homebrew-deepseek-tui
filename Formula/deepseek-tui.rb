class DeepseekTui < Formula
  desc "Terminal-native coding agent for DeepSeek V4"
  homepage "https://github.com/Hmbown/CodeWhale"
  version "0.8.63"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.63/codewhale-macos-arm64", using: :nounzip
      sha256 "c5168080e6215785a30b3f213c49d3a79e17287711712bc9ab0b907a25e8318e"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.63/codewhale-tui-macos-arm64", using: :nounzip
        sha256 "830ccf5e4205b8c6122cd39e22a7abb94ca1e54ea9d370134ac4f85f3f5abcce"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.63/codewhale-macos-x64", using: :nounzip
      sha256 "701ba48d26b888f4c15543ea3db93fa2790dc3fab86219f896273df053fdaf7c"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.63/codewhale-tui-macos-x64", using: :nounzip
        sha256 "c5d1a36d178a262143cf74267232b03a1322a78ccb4c789a21dde2945b9346ec"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.63/codewhale-linux-arm64", using: :nounzip
      sha256 "806bf64f8052e0ec9b78a004b4b217db31c56521754bcaa9ef90edcb0d5d18cf"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.63/codewhale-tui-linux-arm64", using: :nounzip
        sha256 "9b6e13d533dd8392612535ed432a3bd84325a2b843bd196ac47bf4f6832e8b58"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.63/codewhale-linux-x64", using: :nounzip
      sha256 "48c68e507b3d55815fcaed0e1e6534bc5b5418c1591848120dd2d6b74aa667a3"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.63/codewhale-tui-linux-x64", using: :nounzip
        sha256 "500ebab8274952547affe69c57e71ffc9bdf7b931f35d58522c8e7b1ff338f23"
      end
    end
  end

  def install
    bin.install Dir["*"].first => "codewhale"
    resource("tui").stage { bin.install Dir["*"].first => "codewhale-tui" }
  end

  test do
    system "#{bin}/codewhale", "--version"
  end
end
