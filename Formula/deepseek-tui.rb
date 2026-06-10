class DeepseekTui < Formula
  desc "Terminal-native coding agent for DeepSeek V4"
  homepage "https://github.com/Hmbown/CodeWhale"
  version "0.8.56"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.56/codewhale-macos-arm64", using: :nounzip
      sha256 "99a8885514a9d8e76c6f8e3ba63143322c909d22698962bf5863959b5c0253d8"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.56/codewhale-tui-macos-arm64", using: :nounzip
        sha256 "e51dbcc29b9ec3cf2c1e3ba6c40f2608d066ba1945d192a202d645e4dc93715e"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.56/codewhale-macos-x64", using: :nounzip
      sha256 "df663c900a2d1f3638e1126605c48446e21e54a3f35ed9ca260ac5598f44c5f5"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.56/codewhale-tui-macos-x64", using: :nounzip
        sha256 "4c962e578e381e7e211f6a2b7bd1d91843da23ba23684cd676c825adcfa9220a"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.56/codewhale-linux-arm64", using: :nounzip
      sha256 "27a6b840ff3b7c1dbf88b5ae1ec8c73e950ba5e0a0099c4df132c883bf316520"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.56/codewhale-tui-linux-arm64", using: :nounzip
        sha256 "29df0369501f8c7b8241ccb0d99c74aae04211165c0f76411411adcbff4409e1"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.56/codewhale-linux-x64", using: :nounzip
      sha256 "35fbc4bd7eb4a3967dfc83f19ef860b4d7741d8cce39f35b479330e4d7f6d2ac"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.56/codewhale-tui-linux-x64", using: :nounzip
        sha256 "4aa0add7d4f201c3ec42e939086f2ac200b40f4f216928e29fa4b40132852660"
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
