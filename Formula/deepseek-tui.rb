class DeepseekTui < Formula
  desc "Terminal-native coding agent for DeepSeek V4"
  homepage "https://github.com/Hmbown/DeepSeek-TUI"
  version "0.8.26"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.26/deepseek-macos-arm64"
      sha256 "88c7c772f731088d46e10b026944a2990f46d74c51f0807178cbc3373295ac19"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.26/deepseek-tui-macos-arm64"
        sha256 "31a961ae1b32afaacc13cff86bd6f20307c21d3bc7eefab6fc448a53d9bd9733"
      end
    else
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.26/deepseek-macos-x64"
      sha256 "27f2743e4070889784083ab4e4466d392fc8836ea935f88cf0711dd3b88133be"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.26/deepseek-tui-macos-x64"
        sha256 "6679b8f4fd63e888d032c3025e72338ccc13e0f599ef29e64b32443a1dca8f39"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.26/deepseek-linux-arm64"
      sha256 "bce012e61ac77f73220b7ea838bb9fec32e7cf92f59b9c9a12354c64a2bef495"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.26/deepseek-tui-linux-arm64"
        sha256 "48e43d1fa527fc47ff798b8b6103199f137e5021ccf5b821cda3ecb1961c9b87"
      end
    else
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.26/deepseek-linux-x64"
      sha256 "130fb99aacb396b8bb7937e043eaaba405085c89dc3aef63cac7cdb2ed3bc92f"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.26/deepseek-tui-linux-x64"
        sha256 "74b1c2201b3ad29b05468278d73deee700b382c0df2acce8c67a9930d2ca1ebf"
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
