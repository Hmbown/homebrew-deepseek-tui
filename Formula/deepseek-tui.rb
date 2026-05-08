class DeepseekTui < Formula
  desc "Terminal-native coding agent for DeepSeek V4"
  homepage "https://github.com/Hmbown/DeepSeek-TUI"
  version "0.8.20"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.20/deepseek-macos-arm64"
      sha256 "f749a9332bcc47654a93e630eda32c81b79c7dbf5f0aeb36f6382d7a82d8ad30"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.20/deepseek-tui-macos-arm64"
        sha256 "d0a31e361c74f25f2a821b17e8bdbfa9479adf5aa5469017e728d2341f7e1586"
      end
    else
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.20/deepseek-macos-x64"
      sha256 "e6ffb4db3477fa4f4e4fc5579eede5c0a07cfeee48b93472c1ea2acbf1f92471"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.20/deepseek-tui-macos-x64"
        sha256 "d3c40f2a82eea12df8ea5428d7b9515506a78204248b66723c99cb79800b5343"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.20/deepseek-linux-arm64"
      sha256 "c9336044ae53f2ba93880d6a98eb976fd10a7b6edc724e7e4e1fa0791a9284ee"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.20/deepseek-tui-linux-arm64"
        sha256 "041ae021f41b5e70a4f32a50a9938478c3b8788b74a03384f4d59a823da3bbba"
      end
    else
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.20/deepseek-linux-x64"
      sha256 "35fba4321be4733589738fc484e76be092044a177958d169f337bd4d788b7c19"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.20/deepseek-tui-linux-x64"
        sha256 "543eda8d8738522b4f69a289756be9f0b997856410b0b7bbae1dfe1b82d796fc"
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
