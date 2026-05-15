class DeepseekTui < Formula
  desc "Terminal-native coding agent for DeepSeek V4"
  homepage "https://github.com/Hmbown/DeepSeek-TUI"
  version "0.8.38"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.38/deepseek-macos-arm64", using: :nounzip
      sha256 "6b5afecafe0ada9762f13a8325b3e1ffe9d8ec9d2e9ec4bdd1d6477d975ee723"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.38/deepseek-tui-macos-arm64", using: :nounzip
        sha256 "682fd7a3dfce9c882e535dfa23232621daee9700f134d17584513684fce87502"
      end
    else
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.38/deepseek-macos-x64", using: :nounzip
      sha256 "e23f5fa157b7c44e78f98a3dc64d0ad19d1415c101f2efea02f9b3519702320a"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.38/deepseek-tui-macos-x64", using: :nounzip
        sha256 "640a7838fadf2f51a435233294bfc36b6c86b752ea12dea490d56bee683fd7c7"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.38/deepseek-linux-arm64", using: :nounzip
      sha256 "9a6786b7c8cad153c692814d8375a37ef4ce93a4ac3ea50cca9c71e25d363a97"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.38/deepseek-tui-linux-arm64", using: :nounzip
        sha256 "f622474cede9d842aa3eedbbdc55a6e68723d65ebf3f641e9559c4f7434bea2a"
      end
    else
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.38/deepseek-linux-x64", using: :nounzip
      sha256 "a1d9b03b3906f607bd835b70947270e856d44866e0d6f37d71e821354ab5ab57"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.38/deepseek-tui-linux-x64", using: :nounzip
        sha256 "0f626ade7ece88e2b337ffb9a571c4aee932656f4156ed3843fe5d1153a1e92e"
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
