class DeepseekTui < Formula
  desc "Terminal-native coding agent for DeepSeek V4"
  homepage "https://github.com/Hmbown/DeepSeek-TUI"
  version "0.8.40"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.40/deepseek-macos-arm64", using: :nounzip
      sha256 "42ce7008f3fee35a187ff675418be082e3763c48b65c7cc04d63c7563e929e77"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.40/deepseek-tui-macos-arm64", using: :nounzip
        sha256 "9002faf4380fe1e303eec2545877528ddb4d5a652abfbf8be001a4a3de13e012"
      end
    else
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.40/deepseek-macos-x64", using: :nounzip
      sha256 "d05050cbb3d731f1d07c864070fe0a21ab2faf8dc325f684668105a993d40d97"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.40/deepseek-tui-macos-x64", using: :nounzip
        sha256 "de1cb93004fee6f5886bf7e2c0f73d1e7163af8c73ad74dc3f712c1ec6a9fe3b"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.40/deepseek-linux-arm64", using: :nounzip
      sha256 "4d0ada491a09bb77b3e27621945f4a9ebd1e511ea0aa680158fe9203157662cf"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.40/deepseek-tui-linux-arm64", using: :nounzip
        sha256 "b897534a8ed23f0fce2d246dee6ed5413cba854148428fb59363b09a90201e17"
      end
    else
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.40/deepseek-linux-x64", using: :nounzip
      sha256 "5dc4b59c1d04a3ac0ab98c512a5f8d6ae88ead0c5038924daba9d286728f773d"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.40/deepseek-tui-linux-x64", using: :nounzip
        sha256 "70987a1d64827f439731dd6e09492ccdbb891478aff363418160f35f1e371511"
      end
    end
  end

  def install
    bin.install Dir["*"].first => "deepseek"
    resource("tui").stage { bin.install Dir["*"].first => "deepseek-tui" }
  end

  test do
    system "#{bin}/deepseek", "--version"
  end
end
