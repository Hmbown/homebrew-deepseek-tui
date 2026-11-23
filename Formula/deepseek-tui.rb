class DeepseekTui < Formula
  desc "Agentic terminal for open-source and open-weight coding models"
  homepage "https://github.com/codewhale-hq/CodeWhale"
  version "0.10.4"
  license "MIT"
  depends_on "node"
  deprecate! date: "2026-08-14", because: "renamed to codewhale"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/codewhale-hq/CodeWhale/releases/download/v0.10.4/codewhale-macos-arm64", using: :nounzip
      sha256 "1c4e654b4574f82504cb233e96501e7b4aaec0a82dfff07490f7472cb14e8891"
      resource "codew" do
        url "https://github.com/codewhale-hq/CodeWhale/releases/download/v0.10.4/codew-macos-arm64", using: :nounzip
        sha256 "1c4e654b4574f82504cb233e96501e7b4aaec0a82dfff07490f7472cb14e8891"
      end
    else
      url "https://github.com/codewhale-hq/CodeWhale/releases/download/v0.10.4/codewhale-macos-x64", using: :nounzip
      sha256 "6a56fc354d2dd3a853a8eb768ccbac086b591796e33b673522ffa94c6434aa36"
      resource "codew" do
        url "https://github.com/codewhale-hq/CodeWhale/releases/download/v0.10.4/codew-macos-x64", using: :nounzip
        sha256 "6a56fc354d2dd3a853a8eb768ccbac086b591796e33b673522ffa94c6434aa36"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/codewhale-hq/CodeWhale/releases/download/v0.10.4/codewhale-linux-arm64", using: :nounzip
      sha256 "4e809350514e7eb161e121227eca4a3ef6c753d4685d697b66d0819a2a3844a2"
      resource "codew" do
        url "https://github.com/codewhale-hq/CodeWhale/releases/download/v0.10.4/codew-linux-arm64", using: :nounzip
        sha256 "4e809350514e7eb161e121227eca4a3ef6c753d4685d697b66d0819a2a3844a2"
      end
    else
      url "https://github.com/codewhale-hq/CodeWhale/releases/download/v0.10.4/codewhale-linux-x64", using: :nounzip
      sha256 "81d82a15cec265ea72f76515f991ced07aa3fbe377aa3dfb53b70fe4ea30ce60"
      resource "codew" do
        url "https://github.com/codewhale-hq/CodeWhale/releases/download/v0.10.4/codew-linux-x64", using: :nounzip
        sha256 "81d82a15cec265ea72f76515f991ced07aa3fbe377aa3dfb53b70fe4ea30ce60"
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
