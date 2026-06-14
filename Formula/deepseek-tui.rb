class DeepseekTui < Formula
  desc "Terminal-native coding agent for DeepSeek V4"
  homepage "https://github.com/Hmbown/CodeWhale"
  version "0.8.60"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.60/codewhale-macos-arm64", using: :nounzip
      sha256 "3e923b2c57e1dc0ba91bae9bd65b96985894d5362ff49a8438bb9537ccdc0890"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.60/codewhale-tui-macos-arm64", using: :nounzip
        sha256 "3dab191401e96e8ce969d3035173f28561e8f82cb18892f52bd1075865bd74f9"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.60/codewhale-macos-x64", using: :nounzip
      sha256 "72522cacd43c624f3d7f0ef428338dc0d82ed51e6daaa88c7d99474c7eddc985"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.60/codewhale-tui-macos-x64", using: :nounzip
        sha256 "5d5a51cb11ed751d03fa3dcc07a6836403a1cc37bfbdfa2f6b1e40d4e5bb9fda"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.60/codewhale-linux-arm64", using: :nounzip
      sha256 "c634f08814275c9c3ec29790c0d0f75f34b56bd8d33ae1b471abd22913b94e2d"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.60/codewhale-tui-linux-arm64", using: :nounzip
        sha256 "faf982c8306187c68139d3e7f12caa46916e526b84a5e664f2c696428d2cc059"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.60/codewhale-linux-x64", using: :nounzip
      sha256 "26a941c84947a0b711d8c9709b1e507337e3f84a00a7e8a074b09dfd050eb17e"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.60/codewhale-tui-linux-x64", using: :nounzip
        sha256 "2d37faf35716547f42bb74d0ac578c94950d5551be4d6c4eda823a5572bee330"
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
