class DeepseekTui < Formula
  desc "Terminal-native coding agent for DeepSeek V4"
  homepage "https://github.com/Hmbown/CodeWhale"
  version "0.8.42"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.42/deepseek-macos-arm64", using: :nounzip
      sha256 "89e0bdddcaa6ab1617dc3e8f713b483a9889eb4778ba54ff9b974d64e9a3a92e"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.42/deepseek-tui-macos-arm64", using: :nounzip
        sha256 "cf1d51d849dd9acf2ea3823ff96b9c0d5eaddc314a69c460efd5c4216f43df83"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.42/deepseek-macos-x64", using: :nounzip
      sha256 "e7d7f4affd9a89962fbee19f6ab0d1a73219f86b2b695f5925988dc6a11a3d87"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.42/deepseek-tui-macos-x64", using: :nounzip
        sha256 "e4d184f40590f2c85cab85458d9ae5c93748b9eb33f65d15069001031ce1c7a0"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.42/deepseek-linux-arm64", using: :nounzip
      sha256 "07f3e7ea4bae449084a8436cd0d2a393f2cd84627c809a5d376f1c9533f14b74"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.42/deepseek-tui-linux-arm64", using: :nounzip
        sha256 "ba72488171a47c20fbc0d68fb43d611e8e2e064488686c2494d0745e00f73132"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.42/deepseek-linux-x64", using: :nounzip
      sha256 "bd257740fb091add703e7c9459fc791d0bd5d53738f4accbc5c571c4c1d0f386"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.42/deepseek-tui-linux-x64", using: :nounzip
        sha256 "b27f586cc7a58f149a7dfdc44ad3cc225e7b32d0c2bf7ad9d172c624f0784198"
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
