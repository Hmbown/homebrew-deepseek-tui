class Codewhale < Formula
  desc "Agentic terminal for open-source and open-weight coding models"
  homepage "https://github.com/codewhale-hq/CodeWhale"
  version "0.10.1"
  license "MIT"
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/codewhale-hq/CodeWhale/releases/download/v0.10.1/codewhale-macos-arm64", using: :nounzip
      sha256 "e50fdb7dfbb39d7c01eb63175da01bc40f16fb958e01cbcbef03220460302654"
      resource "codew" do
        url "https://github.com/codewhale-hq/CodeWhale/releases/download/v0.10.1/codew-macos-arm64", using: :nounzip
        sha256 "e50fdb7dfbb39d7c01eb63175da01bc40f16fb958e01cbcbef03220460302654"
      end
    else
      url "https://github.com/codewhale-hq/CodeWhale/releases/download/v0.10.1/codewhale-macos-x64", using: :nounzip
      sha256 "67019fd263cf6b1c8608e1748e368d472346da0ad417ef5b9428a887dfbb9cb1"
      resource "codew" do
        url "https://github.com/codewhale-hq/CodeWhale/releases/download/v0.10.1/codew-macos-x64", using: :nounzip
        sha256 "67019fd263cf6b1c8608e1748e368d472346da0ad417ef5b9428a887dfbb9cb1"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/codewhale-hq/CodeWhale/releases/download/v0.10.1/codewhale-linux-arm64", using: :nounzip
      sha256 "efe702a5083fe78a7e09676b129dedba4f595a12b4c824c7f1a794da9ca6d6da"
      resource "codew" do
        url "https://github.com/codewhale-hq/CodeWhale/releases/download/v0.10.1/codew-linux-arm64", using: :nounzip
        sha256 "efe702a5083fe78a7e09676b129dedba4f595a12b4c824c7f1a794da9ca6d6da"
      end
    else
      url "https://github.com/codewhale-hq/CodeWhale/releases/download/v0.10.1/codewhale-linux-x64", using: :nounzip
      sha256 "ed2d83b3853de803ee39f574c745d1e1c9f6f8bf99ed3aec3835425e0c26993b"
      resource "codew" do
        url "https://github.com/codewhale-hq/CodeWhale/releases/download/v0.10.1/codew-linux-x64", using: :nounzip
        sha256 "ed2d83b3853de803ee39f574c745d1e1c9f6f8bf99ed3aec3835425e0c26993b"
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
