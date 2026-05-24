class DeepseekTui < Formula
  desc "Terminal-native coding agent for DeepSeek V4"
  homepage "https://github.com/Hmbown/CodeWhale"
  version "0.8.44"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.44/deepseek-macos-arm64", using: :nounzip
      sha256 "325a09144164dc9b78dca98f63b364ee6c0fdee43dddc777834302d3caee31ed"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.44/deepseek-tui-macos-arm64", using: :nounzip
        sha256 "4d5f6c67c798f8d4ad77af45240b6ee9c26fc3548e06b4b9d9cae73784547a0a"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.44/deepseek-macos-x64", using: :nounzip
      sha256 "74bf04db14d4aa7c06d2179dd462931065753fc399bf3eb8078ea6231f3fc438"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.44/deepseek-tui-macos-x64", using: :nounzip
        sha256 "67fd5015ed52a35153b9b05d860fc4d986a71fe2245e389ef1b68cffa6fa4d46"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.44/deepseek-linux-arm64", using: :nounzip
      sha256 "46126a0b8247a7b60692edce2aa8dabfd72fce8cdf17ffce77f3a3622d9ed933"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.44/deepseek-tui-linux-arm64", using: :nounzip
        sha256 "023341791aed15b7308ada5b0e3219bfd9cd6e0e9b852372e5f85003a00e4361"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.44/deepseek-linux-x64", using: :nounzip
      sha256 "96eaba81caffa1faa8546a71161b24e6e3fa18d66419b5a42a99c20b34787560"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.44/deepseek-tui-linux-x64", using: :nounzip
        sha256 "5e72bce08886dc45ce384b840c502bc1f92b39ec9cd50b118f71e0a1744ba0d0"
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
