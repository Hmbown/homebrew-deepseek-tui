class DeepseekTui < Formula
  desc "Agentic terminal for open-source and open-weight coding models"
  homepage "https://github.com/codewhale-hq/CodeWhale"
  version "0.10.2"
  license "MIT"
  depends_on "node"
  deprecate! date: "2026-08-14", because: "renamed to codewhale"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/codewhale-hq/CodeWhale/releases/download/v0.10.2/codewhale-macos-arm64", using: :nounzip
      sha256 "da0229610647f1cc2dd14c4227b333a92ea276a49f5d4d79160fa19e515e590d"
      resource "codew" do
        url "https://github.com/codewhale-hq/CodeWhale/releases/download/v0.10.2/codew-macos-arm64", using: :nounzip
        sha256 "da0229610647f1cc2dd14c4227b333a92ea276a49f5d4d79160fa19e515e590d"
      end
    else
      url "https://github.com/codewhale-hq/CodeWhale/releases/download/v0.10.2/codewhale-macos-x64", using: :nounzip
      sha256 "ac135d8961525b4092101a15874016d42f71ef821c9c34db3b8f936aad9cb988"
      resource "codew" do
        url "https://github.com/codewhale-hq/CodeWhale/releases/download/v0.10.2/codew-macos-x64", using: :nounzip
        sha256 "ac135d8961525b4092101a15874016d42f71ef821c9c34db3b8f936aad9cb988"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/codewhale-hq/CodeWhale/releases/download/v0.10.2/codewhale-linux-arm64", using: :nounzip
      sha256 "b7c55e36f7ef30c8fae4b8741bfaf9e0177220a9d4d6d3e26650609b4d9ffe90"
      resource "codew" do
        url "https://github.com/codewhale-hq/CodeWhale/releases/download/v0.10.2/codew-linux-arm64", using: :nounzip
        sha256 "b7c55e36f7ef30c8fae4b8741bfaf9e0177220a9d4d6d3e26650609b4d9ffe90"
      end
    else
      url "https://github.com/codewhale-hq/CodeWhale/releases/download/v0.10.2/codewhale-linux-x64", using: :nounzip
      sha256 "28ac984a2f145bf99b29933498a3f951a591283c22782933ce933861dda6c70b"
      resource "codew" do
        url "https://github.com/codewhale-hq/CodeWhale/releases/download/v0.10.2/codew-linux-x64", using: :nounzip
        sha256 "28ac984a2f145bf99b29933498a3f951a591283c22782933ce933861dda6c70b"
      end
    end
  end

  def install
    bin.install Dir["*"].first => "codewhale"
    resource("codew").stage { bin.install Dir["*"].first => "codew" }
  end

  test do
    system "#{bin}/codewhale", "--version"
    system "#{bin}/codew", "--version"
  end
end
