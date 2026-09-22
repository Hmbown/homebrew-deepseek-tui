class Codewhale < Formula
  desc "Agentic terminal for open-source and open-weight coding models"
  homepage "https://github.com/Hmbown/CodeWhale"
  version "0.10.0"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.10.0/codewhale-macos-arm64", using: :nounzip
      sha256 "25774dadc725272f56a1734f1d2b24dd1051e9b43d7b39a30c460dfbbb0bb6e4"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.10.0/codew-macos-arm64", using: :nounzip
        sha256 "25774dadc725272f56a1734f1d2b24dd1051e9b43d7b39a30c460dfbbb0bb6e4"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.10.0/codewhale-macos-x64", using: :nounzip
      sha256 "2ab6a8c73333cb70dd951229c38ea13ac9a9b24dbd64dcf605ec55d2958d5456"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.10.0/codew-macos-x64", using: :nounzip
        sha256 "2ab6a8c73333cb70dd951229c38ea13ac9a9b24dbd64dcf605ec55d2958d5456"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.10.0/codewhale-linux-arm64", using: :nounzip
      sha256 "f3e2d82257cac33ef033f033a9638cb00189a3334deb58fbff7b89aed218273a"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.10.0/codew-linux-arm64", using: :nounzip
        sha256 "f3e2d82257cac33ef033f033a9638cb00189a3334deb58fbff7b89aed218273a"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.10.0/codewhale-linux-x64", using: :nounzip
      sha256 "c443c2c32c743dd80ff56397b1e7bbfe55b1ca6306ff55065b977bc655d50ed1"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.10.0/codew-linux-x64", using: :nounzip
        sha256 "c443c2c32c743dd80ff56397b1e7bbfe55b1ca6306ff55065b977bc655d50ed1"
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
