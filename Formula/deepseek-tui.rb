class DeepseekTui < Formula
  desc "Terminal-native coding agent for DeepSeek V4"
  homepage "https://github.com/Hmbown/CodeWhale"
  version "0.8.65"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.65/codewhale-macos-arm64", using: :nounzip
      sha256 "9afcdbcc910c142ada31467b6a5e4ac76b9b46c90229418bf156e627ecac924c"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.65/codewhale-tui-macos-arm64", using: :nounzip
        sha256 "cb659fa1c33ba84c3ceb0488983ff6c735177c32cb02b0ded5601bbd46f0addb"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.65/codewhale-macos-x64", using: :nounzip
      sha256 "9be7d5022ad434c093b6c851580a2a9853adac7b9cc92c6eca29f45b0d69974e"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.65/codewhale-tui-macos-x64", using: :nounzip
        sha256 "4133c97ff51831ca1f52c35f3f20425a07c533d7d71e330247269471d17aafea"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.65/codewhale-linux-arm64", using: :nounzip
      sha256 "48b40ec62e3c5dabdfc141345b81b2fcd6bec21baedac479eaf5d71d3266c14b"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.65/codewhale-tui-linux-arm64", using: :nounzip
        sha256 "8cf7281b6f0cfe466b794f3a3575b4397d8106c4d3dbb49df568ce02a7a6a75c"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.65/codewhale-linux-x64", using: :nounzip
      sha256 "243ebdb823613b6edcad404b507aa985075f009aab00f388aeaeb94cddae1c51"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.65/codewhale-tui-linux-x64", using: :nounzip
        sha256 "535b03468524009e67fb86ea67d26b031d51f515d2d99205ba44c579515a4ff8"
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
