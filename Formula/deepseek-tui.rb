class DeepseekTui < Formula
  desc "Agentic terminal for open-source and open-weight coding models"
  homepage "https://github.com/Hmbown/CodeWhale"
  version "0.9.13"
  license "MIT"
  depends_on "node"
  deprecate! date: "2026-08-14", because: "renamed to codewhale"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.13/codewhale-macos-arm64", using: :nounzip
      sha256 "4b5f2a885ff814cc105b864b012be2fbb12a46a78bf6a85276f661c1bbdcce0a"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.13/codew-macos-arm64", using: :nounzip
        sha256 "4b5f2a885ff814cc105b864b012be2fbb12a46a78bf6a85276f661c1bbdcce0a"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.13/codewhale-macos-x64", using: :nounzip
      sha256 "b7a45dd329df4de47eed3e20f8743d4a93aaa4817fac642ccad116c98fac006f"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.13/codew-macos-x64", using: :nounzip
        sha256 "b7a45dd329df4de47eed3e20f8743d4a93aaa4817fac642ccad116c98fac006f"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.13/codewhale-linux-arm64", using: :nounzip
      sha256 "0605271d2a343b241232966ec7ca11cf93170289d05a85ad1c513116be77307d"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.13/codew-linux-arm64", using: :nounzip
        sha256 "0605271d2a343b241232966ec7ca11cf93170289d05a85ad1c513116be77307d"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.13/codewhale-linux-x64", using: :nounzip
      sha256 "593ae256756f969ea9f550e8733303abc85cd3ee0dd2c0899f4a76df7103fe7e"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.13/codew-linux-x64", using: :nounzip
        sha256 "593ae256756f969ea9f550e8733303abc85cd3ee0dd2c0899f4a76df7103fe7e"
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
