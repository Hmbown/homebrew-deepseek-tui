class DeepseekTui < Formula
  desc "Agentic terminal for open-source and open-weight coding models"
  homepage "https://github.com/Hmbown/CodeWhale"
  version "0.9.8"
  license "MIT"
  deprecate! date: "2026-08-14", because: "renamed to codewhale"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.8/codewhale-macos-arm64", using: :nounzip
      sha256 "5fc3f01d3c412ba00475b16e4a60695c54e5b1f11f4ef1918d5b97835f7516ad"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.8/codew-macos-arm64", using: :nounzip
        sha256 "5fc3f01d3c412ba00475b16e4a60695c54e5b1f11f4ef1918d5b97835f7516ad"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.8/codewhale-macos-x64", using: :nounzip
      sha256 "61cae935b41ca4e49607969f469ca0eeb6d7983533bbe5054b7d7f5c8c44e0cb"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.8/codew-macos-x64", using: :nounzip
        sha256 "61cae935b41ca4e49607969f469ca0eeb6d7983533bbe5054b7d7f5c8c44e0cb"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.8/codewhale-linux-arm64", using: :nounzip
      sha256 "af4f0c917a49056c5965addc74369cbfd6f9cd276197f028f6fd9301425c5db4"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.8/codew-linux-arm64", using: :nounzip
        sha256 "af4f0c917a49056c5965addc74369cbfd6f9cd276197f028f6fd9301425c5db4"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.8/codewhale-linux-x64", using: :nounzip
      sha256 "f3a035de438b5904e9f032d330990987bbd19843ae1cb5c1e37d8b1b782ec1ea"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.8/codew-linux-x64", using: :nounzip
        sha256 "f3a035de438b5904e9f032d330990987bbd19843ae1cb5c1e37d8b1b782ec1ea"
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
