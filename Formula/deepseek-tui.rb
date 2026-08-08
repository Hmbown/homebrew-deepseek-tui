class DeepseekTui < Formula
  desc "Agentic terminal for open-source and open-weight coding models"
  homepage "https://github.com/Hmbown/CodeWhale"
  version "0.9.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.5/codewhale-macos-arm64", using: :nounzip
      sha256 "57c767e689471c6faf14768212c523c7e5056ff1449bc96f7338400d2340eae2"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.5/codew-macos-arm64", using: :nounzip
        sha256 "57c767e689471c6faf14768212c523c7e5056ff1449bc96f7338400d2340eae2"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.5/codewhale-macos-x64", using: :nounzip
      sha256 "a7a21e59ab60a46d13a4f73200410e82cca2d32e15d8717e64f28f9b9d19806f"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.5/codew-macos-x64", using: :nounzip
        sha256 "a7a21e59ab60a46d13a4f73200410e82cca2d32e15d8717e64f28f9b9d19806f"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.5/codewhale-linux-arm64", using: :nounzip
      sha256 "d882c620273298a5b096345c3762b83653518aa878118cb8ceb5e8be15f0c1e2"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.5/codew-linux-arm64", using: :nounzip
        sha256 "d882c620273298a5b096345c3762b83653518aa878118cb8ceb5e8be15f0c1e2"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.5/codewhale-linux-x64", using: :nounzip
      sha256 "19986b12c005ad6e140203595254c611933b85a86b3affcc63c5440afa388f27"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.5/codew-linux-x64", using: :nounzip
        sha256 "19986b12c005ad6e140203595254c611933b85a86b3affcc63c5440afa388f27"
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
