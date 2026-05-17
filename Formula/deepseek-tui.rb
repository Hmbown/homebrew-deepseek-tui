class DeepseekTui < Formula
  desc "Terminal-native coding agent for DeepSeek V4"
  homepage "https://github.com/Hmbown/DeepSeek-TUI"
  version "0.8.39"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.39/deepseek-macos-arm64", using: :nounzip
      sha256 "bf79617802a422b0a44231021d68f892265638ea2b8763a1cff2bc34613ccca2"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.39/deepseek-tui-macos-arm64", using: :nounzip
        sha256 "7555d3cc66729b74ce93a243f038bb0a3d61e49111625f6f4dc0c7f7ca726475"
      end
    else
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.39/deepseek-macos-x64", using: :nounzip
      sha256 "9a457fe22f86602b059e646b249f6d1975d1adfc24538e401b3fcbfda2cc4caa"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.39/deepseek-tui-macos-x64", using: :nounzip
        sha256 "26f93fd211f7cf13553928c153466f0f388661b8965a6484732d4f4ae52d19f8"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.39/deepseek-linux-arm64", using: :nounzip
      sha256 "41eae3b3cc43c0ca2fdbe2eedf2054ce46e31602be48cc11ad252d889c043866"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.39/deepseek-tui-linux-arm64", using: :nounzip
        sha256 "08b379583cee5be5e071e028ea7a7682252741931265a3b8eae054a69824cbe5"
      end
    else
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.39/deepseek-linux-x64", using: :nounzip
      sha256 "2c8eb84034fb5d99077a460dd6137f2c919c6d8a2584ce2647540d90d3de1a8e"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.39/deepseek-tui-linux-x64", using: :nounzip
        sha256 "e4f7601c7c54e5f26b8b207cb8f3da038f86b868b9afc1d45d9e47606d6a5802"
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
