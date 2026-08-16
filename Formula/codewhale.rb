class Codewhale < Formula
  desc "Agentic terminal for open-source and open-weight coding models"
  homepage "https://github.com/Hmbown/CodeWhale"
  version "0.9.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.8/codewhale-macos-arm64", using: :nounzip
      sha256 "b4faf51b83ac3bc94b3a43a0a54699af695ece7c72708ee11d0ef1c8cc6ac67c"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.8/codew-macos-arm64", using: :nounzip
        sha256 "b4faf51b83ac3bc94b3a43a0a54699af695ece7c72708ee11d0ef1c8cc6ac67c"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.8/codewhale-macos-x64", using: :nounzip
      sha256 "9dfa7aac6ff0ba85b99673108b911f3ecb4f70f86b97dd3c0bf4340a87894f8f"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.8/codew-macos-x64", using: :nounzip
        sha256 "9dfa7aac6ff0ba85b99673108b911f3ecb4f70f86b97dd3c0bf4340a87894f8f"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.8/codewhale-linux-arm64", using: :nounzip
      sha256 "f11ef2474d60546b29412b7413f6b9e99bebcad0643f20960a5f0d2cd8dba7c6"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.8/codew-linux-arm64", using: :nounzip
        sha256 "f11ef2474d60546b29412b7413f6b9e99bebcad0643f20960a5f0d2cd8dba7c6"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.8/codewhale-linux-x64", using: :nounzip
      sha256 "242cc3209b26ef79721cc86164c4f8c81393b7ad5a9ae815da419abefa3b1519"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.8/codew-linux-x64", using: :nounzip
        sha256 "242cc3209b26ef79721cc86164c4f8c81393b7ad5a9ae815da419abefa3b1519"
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
