class DeepseekTui < Formula
  desc "Terminal-native coding agent for DeepSeek V4"
  homepage "https://github.com/Hmbown/DeepSeek-TUI"
  version "0.8.24"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.24/deepseek-macos-arm64"
      sha256 "d7bf13a950a674815affef6beff44a405668f43ab62ed6887b70b16b90929e7b"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.24/deepseek-tui-macos-arm64"
        sha256 "2727715a2e4539d5423168a6cdbf6208b5d7c9165274bed34a6f4cb376cfbb84"
      end
    else
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.24/deepseek-macos-x64"
      sha256 "17047bb49e3828a2da1b72c09c703f26498176fa89f6666d3bd439a68ec88fca"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.24/deepseek-tui-macos-x64"
        sha256 "df3d1738f8c7837449223a203cc2ae937aaa4938f1a5c39d17982c470e226577"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.24/deepseek-linux-arm64"
      sha256 "c9510da5c8e0d7efb86e57c3dc341b6c910e1e646a8f1956ae38fa82ec6bca29"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.24/deepseek-tui-linux-arm64"
        sha256 "cb7c1699ee1978bd36b06dc981db3b93d8bd1cbe2e8c6434be5b2d01d2393573"
      end
    else
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.24/deepseek-linux-x64"
      sha256 "afa9c3c02aaa067b3b1af69d9d5d0208f1fef385c1ac93742ba837f577bf685f"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.24/deepseek-tui-linux-x64"
        sha256 "994425a619e6be97c700436b4d0328a8398d18169d6d92b6877bcf9d93cf506a"
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
