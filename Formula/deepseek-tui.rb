class DeepseekTui < Formula
  desc "Terminal-native coding agent for DeepSeek V4"
  homepage "https://github.com/Hmbown/DeepSeek-TUI"
  version "0.8.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.13/deepseek-macos-arm64"
      sha256 "16f35cf6c8ecaa62d578f570a856503d6adf91faf7a20d331dabb8eb9119c818"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.13/deepseek-tui-macos-arm64"
        sha256 "09e95ff4a8da7b837177772b150f308b461d93cf256fe952e47bd2bb5a8eb5a2"
      end
    else
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.13/deepseek-macos-x64"
      sha256 "cf16d27b9eca1d6f8f9feb65eb3262ade53d86824c17c6b1bfda2e95f5a71ae2"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.13/deepseek-tui-macos-x64"
        sha256 "4151438bc199824219179d2f6f65c466fb8f5fe7ee7488106a4598b7e6645d2d"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.13/deepseek-linux-arm64"
      sha256 "99cf7e98dca6ebaef1c385a59bee8e68db57b232bb3eb41eff6684f5c32067ed"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.13/deepseek-tui-linux-arm64"
        sha256 "0e537f6b27297d4821d3a24c1df6c11a958be730e2db2e5fc24750c4b191a1d3"
      end
    else
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.13/deepseek-linux-x64"
      sha256 "0288a9e4fd7032dfb4ab526d4e153740d926581c6386ae297cae7ce3a1ef3a2c"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.13/deepseek-tui-linux-x64"
        sha256 "bdc052e20c0ea36324cf76798d16dfe491bb4d787186202a8ca842c21f26b3f0"
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
