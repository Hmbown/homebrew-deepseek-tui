class DeepseekTui < Formula
  desc "Terminal-native coding agent for DeepSeek V4"
  homepage "https://github.com/Hmbown/CodeWhale"
  version "0.8.48"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.48/codewhale-macos-arm64", using: :nounzip
      sha256 "20619455d3e4ccc3c9bf6a673fd0e3215da4f06b0221f448b67eb411b4840689"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.48/codewhale-tui-macos-arm64", using: :nounzip
        sha256 "224d2b7cab7f9e414d8a13b6cd4efc8c8d11a3d419880ae446ef43463d06caea"
      end
      resource "legacy-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.48/deepseek-macos-arm64", using: :nounzip
        sha256 "c00fe3f679ea0313ad8255e806b40676fecf02eb34072862725a793f18859611"
      end
      resource "legacy-tui-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.48/deepseek-tui-macos-arm64", using: :nounzip
        sha256 "14f3caf8c308fac0836add0b09c066c7377f2bd2f833e37010376aa9edd9fdf2"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.48/codewhale-macos-x64", using: :nounzip
      sha256 "ea596aa764831bb80e0f142f527372b2ac3ba10ca77ca8b0ef7b4d561d73abd3"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.48/codewhale-tui-macos-x64", using: :nounzip
        sha256 "de670ecbd0932acfa2adec5ebd30a11bb80f1a22f400f6534da63e22b67aab57"
      end
      resource "legacy-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.48/deepseek-macos-x64", using: :nounzip
        sha256 "b63c64cffd3ccbe4c3cf587e0bad4c4f386cd6aea975795af458929dd632a8c0"
      end
      resource "legacy-tui-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.48/deepseek-tui-macos-x64", using: :nounzip
        sha256 "a8a095c5aefa836da25b073ea16c3313ba0f5efb8c6ba70fe5076cc8a7f5c774"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.48/codewhale-linux-arm64", using: :nounzip
      sha256 "b902467cbf77f39ee76f1d52f35002fb0b37a4a89ac9fefda0b1782f56b6e59d"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.48/codewhale-tui-linux-arm64", using: :nounzip
        sha256 "128ff5ef3dd56ee68501b75ba91dbbbec9af184db9636d40fca387ecfbed6079"
      end
      resource "legacy-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.48/deepseek-linux-arm64", using: :nounzip
        sha256 "5135d16f104cdb5cb37f0d898959657706a29b8e01acc34f438a5969396bc32d"
      end
      resource "legacy-tui-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.48/deepseek-tui-linux-arm64", using: :nounzip
        sha256 "d788a097a057b892f15c728d0da1cfe15d20d440ec2576a0c47695fd80a5e1fa"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.48/codewhale-linux-x64", using: :nounzip
      sha256 "28a521445ad6e047c7d213b0948e35eaf069f77ce4c8100b0763075711f4febe"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.48/codewhale-tui-linux-x64", using: :nounzip
        sha256 "2ffa8545c30f094906410f4d6ae0b5042f79dd56d95b8d773baf265bb30c3108"
      end
      resource "legacy-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.48/deepseek-linux-x64", using: :nounzip
        sha256 "b38b8c5e8daada0551d7e48c144a6ce8834164f38c8de07f3ff36948f6905fae"
      end
      resource "legacy-tui-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.48/deepseek-tui-linux-x64", using: :nounzip
        sha256 "76b33a484d4b9e43e4ba4521464ac991a8ab623c7b8ffc39eb48ecc2706874c5"
      end
    end
  end

  def install
    bin.install Dir["*"].first => "codewhale"
    resource("tui").stage { bin.install Dir["*"].first => "codewhale-tui" }
    resource("legacy-shim").stage { bin.install Dir["*"].first => "deepseek" }
    resource("legacy-tui-shim").stage { bin.install Dir["*"].first => "deepseek-tui" }
  end

  test do
    system "#{bin}/codewhale", "--version"
  end
end
