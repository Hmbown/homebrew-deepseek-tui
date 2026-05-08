class DeepseekTui < Formula
  desc "Terminal-native coding agent for DeepSeek V4"
  homepage "https://github.com/Hmbown/DeepSeek-TUI"
  version "0.8.22"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.22/deepseek-macos-arm64"
      sha256 "8a5ab53e3ffd184e906cebc8e28bc9397b1f3ee69570a8bda808a9f6d81ecd27"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.22/deepseek-tui-macos-arm64"
        sha256 "8eb415c3a63d27a589799024b161df257ee5726cf02dfb64f9de0044a409f6bd"
      end
    else
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.22/deepseek-macos-x64"
      sha256 "3db158059c48e2b2f9f3eba169db18e758a85b92f21923f4c8a4ab3f8c97d475"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.22/deepseek-tui-macos-x64"
        sha256 "d331d7e0ca41c32fa05c0cb2daf6d28149778dd627e9f3de59693a84069ed373"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.22/deepseek-linux-arm64"
      sha256 "2d7bc81abbabe4c39617beea6cbc9bfc3d044cf4eb8538626b8b3d36a4266afe"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.22/deepseek-tui-linux-arm64"
        sha256 "718e6fcfee8efb8bca488c5643d899cae8f26ca946da879792b6900ef54b994d"
      end
    else
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.22/deepseek-linux-x64"
      sha256 "324af04a1162351779ac96be5b6348567fd91197cff90b39a14ce06754536e2e"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.22/deepseek-tui-linux-x64"
        sha256 "5c41ff289765e992df00ed515000b519d83e2eb5887ea54b78aa544f0a301615"
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
