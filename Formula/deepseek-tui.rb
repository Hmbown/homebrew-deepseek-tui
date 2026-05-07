class DeepseekTui < Formula
  desc "Terminal-native coding agent for DeepSeek V4"
  homepage "https://github.com/Hmbown/DeepSeek-TUI"
  version "0.8.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.15/deepseek-macos-arm64"
      sha256 "c560e17a54d12c20c703a0c301084c0d170684de0b87fcab2ceb5c2b57ad4ad2"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.15/deepseek-tui-macos-arm64"
        sha256 "1093bc3cefca6476bddbc34f8a418c8de60fc081dadeb9d6a675b4c754cf2d01"
      end
    else
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.15/deepseek-macos-x64"
      sha256 "19d8d26f08aec64001023f0baeb01770cdf0d5a598b7968167ee1f77d4479ccc"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.15/deepseek-tui-macos-x64"
        sha256 "039a9990a020277624a827c8d6f33cf1bb377183c3195a1c667206b46f4c58c6"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.15/deepseek-linux-arm64"
      sha256 "540d4ca2d61e9d8de1e4afb4d90bd2bcdfa89a99ae36e69b5439ff6513a73235"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.15/deepseek-tui-linux-arm64"
        sha256 "5010f5034777a5a83f52229b153fa8052d77e84e6c42320b47b1fc31aea6b242"
      end
    else
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.15/deepseek-linux-x64"
      sha256 "0ac43ff4685c1498428b820497b40be0f03bc927495d45a06df4507d4adbf8b4"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.15/deepseek-tui-linux-x64"
        sha256 "b3dc48851a927f2d881759165ce3fe0fd8e652288ef09c4cacccc126c6598204"
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
