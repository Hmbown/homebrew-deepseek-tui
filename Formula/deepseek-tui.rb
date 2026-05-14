class DeepseekTui < Formula
  desc "Terminal-native coding agent for DeepSeek V4"
  homepage "https://github.com/Hmbown/DeepSeek-TUI"
  version "0.8.36"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.36/deepseek-macos-arm64"
      sha256 "b9c8a4dff58965f020069b4a75ea6efb36183288c4a537d90f813bd9a622544d"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.36/deepseek-tui-macos-arm64"
        sha256 "ce5cc9b96ad8868d3c95c2e0f2d637c4c739df40a90a073ec6ca0d139ff36ce7"
      end
    else
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.36/deepseek-macos-x64"
      sha256 "c3f6f762d0c94d45e44a7c768c7bd0cf16b6a2fee0859a8bd43163cd18cb5e8e"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.36/deepseek-tui-macos-x64"
        sha256 "32a4f3fe3beca24ff41d3c07fe0409d3480859688286d020e3e615aab080ed98"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.36/deepseek-linux-arm64"
      sha256 "9634fef0f007342678e4545d913661cd5038c31c892d7ab055395621d6bce234"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.36/deepseek-tui-linux-arm64"
        sha256 "e82ec7da10819756f72c7749ef9c5617aa7a1801560dc1618a1542957f75906a"
      end
    else
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.36/deepseek-linux-x64"
      sha256 "f6794955120863bb26e349fb6588820d641f4c5efc8989e6b05ce66c7d94d91a"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.36/deepseek-tui-linux-x64"
        sha256 "4ff4f1e51b261a5ba50f07928cbb65e06d9cd7c5be73008d186d04674ffaa336"
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
