class DeepseekTui < Formula
  desc "Terminal-native coding agent for DeepSeek V4"
  homepage "https://github.com/Hmbown/CodeWhale"
  version "0.8.67"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.67/codewhale-macos-arm64", using: :nounzip
      sha256 "2c3d74035ff533c8bf39b9126e254c14d4c90d2f4edec5f58586d3863fef57a7"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.67/codewhale-tui-macos-arm64", using: :nounzip
        sha256 "885bccb86b52654958afdbeb50be4f41027e86095f743f862f232b6fbd10ed09"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.67/codewhale-macos-x64", using: :nounzip
      sha256 "9a167f4275025f524bf0979f6e71a018d268288779e799508a98302327128fa3"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.67/codewhale-tui-macos-x64", using: :nounzip
        sha256 "672a9ce1f9fa48924629b545d9745f55223e0095674dc63a8e57c15a0fc6c3e2"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.67/codewhale-linux-arm64", using: :nounzip
      sha256 "e9d7b17b20478f417b3e6a1a77414ab32c3c528e92b1c317e75d182de874b179"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.67/codewhale-tui-linux-arm64", using: :nounzip
        sha256 "f03aa74352bdef02b8803c06b97bbecd7a9b9ee673ec687cf7947ba05abd2902"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.67/codewhale-linux-x64", using: :nounzip
      sha256 "c65d3643a6b5ffe5c8f9875f1c30df8199765b64cb9daf66b8383d45d9fcab4b"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.67/codewhale-tui-linux-x64", using: :nounzip
        sha256 "26451e04533f75e9e74ba974a62ee681b3d00377933947180e113274e197041b"
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
