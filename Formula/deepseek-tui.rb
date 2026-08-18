class DeepseekTui < Formula
  desc "Agentic terminal for open-source and open-weight coding models"
  homepage "https://github.com/Hmbown/CodeWhale"
  version "0.9.9"
  license "MIT"
  deprecate! date: "2026-08-14", because: "renamed to codewhale"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.9/codewhale-macos-arm64", using: :nounzip
      sha256 "a083b6085ec3da030771634e806717bf08cc3b97a9a111b5d97e25fad353b6ba"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.9/codew-macos-arm64", using: :nounzip
        sha256 "a083b6085ec3da030771634e806717bf08cc3b97a9a111b5d97e25fad353b6ba"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.9/codewhale-macos-x64", using: :nounzip
      sha256 "cc29b842d1c96079032c3846ff41b290282d8019420c97fb922c68997d86d839"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.9/codew-macos-x64", using: :nounzip
        sha256 "cc29b842d1c96079032c3846ff41b290282d8019420c97fb922c68997d86d839"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.9/codewhale-linux-arm64", using: :nounzip
      sha256 "9fec70aaea5f60da44f1a33278787c1bb57a1bdc11068bb0c921618482f4afb6"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.9/codew-linux-arm64", using: :nounzip
        sha256 "9fec70aaea5f60da44f1a33278787c1bb57a1bdc11068bb0c921618482f4afb6"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.9/codewhale-linux-x64", using: :nounzip
      sha256 "72acd677549d9f95fe55acb576d38fa4e87d4a2e722bed4270e243654af61f7d"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.9/codew-linux-x64", using: :nounzip
        sha256 "72acd677549d9f95fe55acb576d38fa4e87d4a2e722bed4270e243654af61f7d"
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
