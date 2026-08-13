class DeepseekTui < Formula
  desc "Agentic terminal for open-source and open-weight coding models"
  homepage "https://github.com/Hmbown/CodeWhale"
  version "0.9.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.7/codewhale-macos-arm64", using: :nounzip
      sha256 "293d3112f6598941315203bbf9bb6549205bc020397e2270add0c70500f397b5"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.7/codew-macos-arm64", using: :nounzip
        sha256 "293d3112f6598941315203bbf9bb6549205bc020397e2270add0c70500f397b5"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.7/codewhale-macos-x64", using: :nounzip
      sha256 "1c93a18a175ad6a0fe30d711e88b58d6d12bff0db6687eda60b0142e9b785bad"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.7/codew-macos-x64", using: :nounzip
        sha256 "1c93a18a175ad6a0fe30d711e88b58d6d12bff0db6687eda60b0142e9b785bad"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.7/codewhale-linux-arm64", using: :nounzip
      sha256 "a4104e097920540a76b824050b14bdb07eb8347da26069e3c34388e3178efb13"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.7/codew-linux-arm64", using: :nounzip
        sha256 "a4104e097920540a76b824050b14bdb07eb8347da26069e3c34388e3178efb13"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.7/codewhale-linux-x64", using: :nounzip
      sha256 "74bcfb52b5b513fae608adbb8ed3d0303ef02714cc7836f5b7fd4704a2039891"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.7/codew-linux-x64", using: :nounzip
        sha256 "74bcfb52b5b513fae608adbb8ed3d0303ef02714cc7836f5b7fd4704a2039891"
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
