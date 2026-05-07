class DeepseekTui < Formula
  desc "Terminal-native coding agent for DeepSeek V4"
  homepage "https://github.com/Hmbown/DeepSeek-TUI"
  version "0.8.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.16/deepseek-macos-arm64"
      sha256 "c8bdc57d9b82f48e29b98ee6f0936095d47773c022929d2369e118b2dbab7e76"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.16/deepseek-tui-macos-arm64"
        sha256 "7fdeb2c7e6463bdd2e46411ee750d8b4d9482982909ccc07885b2622dc3682c6"
      end
    else
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.16/deepseek-macos-x64"
      sha256 "9b7280c1a34a0f11ae4720955394db57e11b060413e61273f95dacb45e3b592b"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.16/deepseek-tui-macos-x64"
        sha256 "9e9ce8421710ea6795bd5e753a2fc735e5ce79aa26c876eaaeb26fec04cc64f6"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.16/deepseek-linux-arm64"
      sha256 "fe03b0b0af979ddc609efbf8406e6e90ce08a2ca53ed329977376c3a01c11bc2"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.16/deepseek-tui-linux-arm64"
        sha256 "37b9d52f5495e2f1570e2079f73251c239202d8ebdce8e97c5a852b90ffedad9"
      end
    else
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.16/deepseek-linux-x64"
      sha256 "3f3c9c5999ac423a4344737c3319cdcd4b0fcdc57c2396b71f4fcf093ee4aaf5"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.16/deepseek-tui-linux-x64"
        sha256 "ec5be54478de42782b4049275102fd931d55cd6c3c5d47dc96459d96170598f6"
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
