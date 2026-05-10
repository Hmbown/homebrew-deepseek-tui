class DeepseekTui < Formula
  desc "Terminal-native coding agent for DeepSeek V4"
  homepage "https://github.com/Hmbown/DeepSeek-TUI"
  version "0.8.27"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.27/deepseek-macos-arm64"
      sha256 "4e2c0bf628b4103d7474a01da6740df407b0b93c6b32ae290ca0ad92a4879b13"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.27/deepseek-tui-macos-arm64"
        sha256 "19c4d0f87bc8bc475e7b7b1d65f94f435af2c512dfcae87d82fc8844e57f817e"
      end
    else
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.27/deepseek-macos-x64"
      sha256 "f89ae3769c24787f696e779f5fd0b6c25dce9d7a9e19c747fb23f34c14907a18"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.27/deepseek-tui-macos-x64"
        sha256 "da696c9ee87fa88954b4288c4a7ba9451fc267fc3dd64284d39218f62ab63315"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.27/deepseek-linux-arm64"
      sha256 "a27599a76c4d48f24bbd2e887afc5ffdcf214d84673103c512e76ad0be7f4e82"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.27/deepseek-tui-linux-arm64"
        sha256 "a8c3967edc2e0ba725b7f8980ae845b7de3822330387b8775c499ede52dd799f"
      end
    else
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.27/deepseek-linux-x64"
      sha256 "c279e51e8ece743d10373caa6e5f91e23730acfb2255bfcd5649d072b7ecab44"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.27/deepseek-tui-linux-x64"
        sha256 "ae2cea9702ab21d3efb8407e9251c502f9be687eefa3245e30cf7ea505170c94"
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
