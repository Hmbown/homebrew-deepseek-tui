class DeepseekTui < Formula
  desc "Terminal-native coding agent for DeepSeek V4"
  homepage "https://github.com/Hmbown/CodeWhale"
  version "0.8.57"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.57/codewhale-macos-arm64", using: :nounzip
      sha256 "8b8543de53fc6aae5f4cd1cd2edc0fd699da69b00b8de78241885eb253e65e5c"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.57/codewhale-tui-macos-arm64", using: :nounzip
        sha256 "3f94185b5f02adbd709e2a618446ee87cae4a9b8be68f2b534b0fd28030d3523"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.57/codewhale-macos-x64", using: :nounzip
      sha256 "9dc63187cad998b2a59e5d495366df8487331c7fe8195d678adfec4944563373"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.57/codewhale-tui-macos-x64", using: :nounzip
        sha256 "839525b4fda75835175367634654a8d0d78d9d2f1af730d0b127100f68bc81dc"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.57/codewhale-linux-arm64", using: :nounzip
      sha256 "5454b1946f2d18aa3ab2b1a0bc15c488902a434febbe3fbf98ddb749d491b6d5"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.57/codewhale-tui-linux-arm64", using: :nounzip
        sha256 "5b4690658790eb9ca3cdddd708e05de19ea0581414181738364edf4ecfb41259"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.57/codewhale-linux-x64", using: :nounzip
      sha256 "1e9d19ea6c1e682fac07f047d8aa43d56fec752d267baf6912b2a258e6b61aa6"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.57/codewhale-tui-linux-x64", using: :nounzip
        sha256 "744c5f86b7c6b35c1b5969af5d84ee0865ca9e4843fbbac1637d9a57ddfc0f3d"
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
