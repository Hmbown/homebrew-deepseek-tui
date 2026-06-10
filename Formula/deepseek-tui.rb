class DeepseekTui < Formula
  desc "Terminal-native coding agent for DeepSeek V4"
  homepage "https://github.com/Hmbown/CodeWhale"
  version "0.8.56"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.56/codewhale-macos-arm64", using: :nounzip
      sha256 "57ef5a30baa0918259353d1f22b6754a1d2e2dcd5435293c2fbaa4b4f529cccd"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.56/codewhale-tui-macos-arm64", using: :nounzip
        sha256 "64d01d567cc7caacdc575c2b7d9b4690d5687e9dc755cb5058f57466e94f4966"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.56/codewhale-macos-x64", using: :nounzip
      sha256 "101347f6d757400379423aad7d769fa847e4b44a2f8e61932d1ddab4e70fa1a6"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.56/codewhale-tui-macos-x64", using: :nounzip
        sha256 "24841c9d8c24b6438052a002a176448c813c08f958fac358564b76f339f78713"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.56/codewhale-linux-arm64", using: :nounzip
      sha256 "fba68710cea040fb4c462618df49984186dbc6e1719eb0405d932b9466bbbb3b"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.56/codewhale-tui-linux-arm64", using: :nounzip
        sha256 "a42f8121ad112f7518bbd19e28897681f148371f040c55e7099d634930c3f734"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.56/codewhale-linux-x64", using: :nounzip
      sha256 "23f71e1da8f22204245ad2574ec7f618e9a97303c98b16e2a555635183d86267"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.56/codewhale-tui-linux-x64", using: :nounzip
        sha256 "75a83d7fc3e6db8659a2ef3ee14ce51ed4fcd8d62433e59b190e23c5c0f3ddd7"
      end
    end
  end

  def install
    bin.install Dir["*"].first => "codewhale"
    resource("tui").stage { bin.install Dir["*"].first => "codewhale-tui" }
  end

  test do
    system "#{bin}/codewhale", "--version"
  end
end
