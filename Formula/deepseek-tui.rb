class DeepseekTui < Formula
  desc "Terminal-native coding agent for DeepSeek V4"
  homepage "https://github.com/Hmbown/DeepSeek-TUI"
  version "0.8.37"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.37/deepseek-macos-arm64", using: :nounzip
      sha256 "e5d4ff628f56e19ac44274a6b470b681ea85122df5f10dde0c3c81ec68876e68"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.37/deepseek-tui-macos-arm64", using: :nounzip
        sha256 "6f367bdafb6ae386ef95249a024e946021feaec16889d67533dc4a54602358c6"
      end
    else
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.37/deepseek-macos-x64", using: :nounzip
      sha256 "c2cfb5df1a52e3e7ffb31539f26da5a951b82d1ba522c6450fe97303ef8bbf28"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.37/deepseek-tui-macos-x64", using: :nounzip
        sha256 "e36067a5b9a3b526b73120693ea21ec50c17e102ea5e4b8bce950a5111204f14"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.37/deepseek-linux-arm64", using: :nounzip
      sha256 "207e89494af555d2cb50560dfc79877cddc78810d803c3830b304ebfd31ace51"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.37/deepseek-tui-linux-arm64", using: :nounzip
        sha256 "8c0773a4e2787ab2bc3c048163ad31d3243227741721d8ecdca37f1b40139235"
      end
    else
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.37/deepseek-linux-x64", using: :nounzip
      sha256 "afa249cd9ca5f50ac73f529679d303b16a888a97102f72bde6f81cad0466b9e7"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.37/deepseek-tui-linux-x64", using: :nounzip
        sha256 "d1a1697c061b40bb9943bd9b66750990533029d1c4cfcf297e574632c1f08f67"
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
