class DeepseekTui < Formula
  desc "Terminal-native coding agent for DeepSeek V4"
  homepage "https://github.com/Hmbown/DeepSeek-TUI"
  version "0.8.18"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.18/deepseek-macos-arm64"
      sha256 "db76750b7d79001cb7179a8cf158b2f839fa050f5e49b33796d183984e546958"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.18/deepseek-tui-macos-arm64"
        sha256 "5f32b4b244eff164b3efa0d091d8b2ee4322aea60bde5353a64b67218d18a63c"
      end
    else
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.18/deepseek-macos-x64"
      sha256 "f7636c01249e64634b36c05dae55813574e1ea5c43d918ed50b637a6776f6700"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.18/deepseek-tui-macos-x64"
        sha256 "650020f2ff6758fed98bfceff17d07bf1a44fc9c5c86f6007dce4d45e9cb82cf"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.18/deepseek-linux-arm64"
      sha256 "36e2d238eaef210c7ae0909d7e20dddcfe1a6a78f414978c7dee4f1971c08770"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.18/deepseek-tui-linux-arm64"
        sha256 "8871b06712e5e45a2a16c3d53dce3622c03cb09dd7e730ef92e6eff8b49de683"
      end
    else
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.18/deepseek-linux-x64"
      sha256 "827d656ac56281a95b5ae72fff5214fd9b0cf6e03b7aee181b881c44008dd2db"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.18/deepseek-tui-linux-x64"
        sha256 "3e3f5c7f19fb949189b1b110aae29c62c4f04702c0b3a5e2c817b3b996d2e8b2"
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
