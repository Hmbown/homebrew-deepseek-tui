class DeepseekTui < Formula
  desc "Terminal-native coding agent for DeepSeek V4"
  homepage "https://github.com/Hmbown/DeepSeek-TUI"
  version "0.8.23"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.23/deepseek-macos-arm64"
      sha256 "8b6fcc771a28b791eb73966333acc25e0393a2644a6c36d10aa8e9f44bb99e1d"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.23/deepseek-tui-macos-arm64"
        sha256 "1fb1f2b836fd7cbc44471f8dd98cb21b5c326f4f41dc674ca1b15a2f495cd0a8"
      end
    else
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.23/deepseek-macos-x64"
      sha256 "762cebd51363987382c0d6732efc8519d70e3e279f9185a1170d2fa39a883915"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.23/deepseek-tui-macos-x64"
        sha256 "f49abaad5decb9763c547dbb475be91b0ae2d711dd4af667e07abb037833c05e"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.23/deepseek-linux-arm64"
      sha256 "2e6d079a8029427d9e1353d89aceb782db8e96ed561b159ab1a0f6d3302d6aca"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.23/deepseek-tui-linux-arm64"
        sha256 "d0a02c24a8473813a8a9dc6050045b3132cd22b99b37ba98ff224b1c28816c4d"
      end
    else
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.23/deepseek-linux-x64"
      sha256 "2a622c1b9683f18a87c807e93b5561fa92e7fde2e1f1c0e34f329f8b1ed4a139"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.23/deepseek-tui-linux-x64"
        sha256 "3ae654cf32dd1ed2c1966f1f861df9cce83ca583e7f584082b7a52a92bec7b6f"
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
