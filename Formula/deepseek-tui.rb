class DeepseekTui < Formula
  desc "Terminal-native coding agent for DeepSeek V4"
  homepage "https://github.com/Hmbown/CodeWhale"
  version "0.8.61"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.61/codewhale-macos-arm64", using: :nounzip
      sha256 "9575fe30c7a3eed44c20fa0a98cdc789b61eeea6982842c9c01a5ffc27b40f5b"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.61/codewhale-tui-macos-arm64", using: :nounzip
        sha256 "ab879eba62099ccad848e7e8603ba668af215a38327804cfd7436e82c38ea364"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.61/codewhale-macos-x64", using: :nounzip
      sha256 "1d6f09946152920b3310da7fb2628ddeff55abb3bcc5255626c9bf1dfbfbe5b0"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.61/codewhale-tui-macos-x64", using: :nounzip
        sha256 "902437f022517a675d15c96fbda31f4df2291e85e83304b2465c465e0979e8d6"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.61/codewhale-linux-arm64", using: :nounzip
      sha256 "085b201eb76cbaa7ace7f209abec4110a366b3b7d694899166aeb3a1f8ded9c7"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.61/codewhale-tui-linux-arm64", using: :nounzip
        sha256 "e78feae276e4672d67773e7fc207dbc2df8403a6926bafb35b5e958824cc96fc"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.61/codewhale-linux-x64", using: :nounzip
      sha256 "de4d0afc8fcdc581eb36cce09e24277164eef0746ab11dd14a0f982ee07e2246"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.61/codewhale-tui-linux-x64", using: :nounzip
        sha256 "6158ca0cefc9367b001f0cc27f88adac4c3ca6c2b28bd6db15a2c92c5bccc802"
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
