class DeepseekTui < Formula
  desc "Terminal-native coding agent for DeepSeek V4"
  homepage "https://github.com/Hmbown/DeepSeek-TUI"
  version "0.8.25"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.25/deepseek-macos-arm64"
      sha256 "ef176ce6af3a98cfe85a4818091f4f1fc8438ab720a9c058294c0f0c7e0c4cae"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.25/deepseek-tui-macos-arm64"
        sha256 "fa05fbb9f31f414eb1853168021850f9edef9f158bd837d840590a64e2783cad"
      end
    else
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.25/deepseek-macos-x64"
      sha256 "50b5a1e2feeed6a57bb6c1d900c230c54533fb891296b045e1befa63ce5231aa"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.25/deepseek-tui-macos-x64"
        sha256 "da4e7716bc7f13955726449ab50dd602c29e38b1043dca7fa084ddc562c84b86"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.25/deepseek-linux-arm64"
      sha256 "7106500f339f963da269d0b5e566ac4d225acae782b1e6bef3d5cde53dcc2563"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.25/deepseek-tui-linux-arm64"
        sha256 "cb0fdb60126bd95e723de8199d82a6299f9728b84ebe0d2d4c28a695f4bbd4d2"
      end
    else
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.25/deepseek-linux-x64"
      sha256 "e28908300117af518256740ac96c60d5425684be807b2d2662b913c7432c82c5"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.25/deepseek-tui-linux-x64"
        sha256 "0e5541fad59555fc79b1af339c288bb066011c3388f1edbfb60b0ac4aa377e4d"
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
