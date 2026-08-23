class Codewhale < Formula
  desc "Agentic terminal for open-source and open-weight coding models"
  homepage "https://github.com/Hmbown/CodeWhale"
  version "0.9.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.11/codewhale-macos-arm64", using: :nounzip
      sha256 "dbbb2c51711693e5cc07cb55ef0b9ad4d464c3d14a825292668fef39c2a54bb7"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.11/codew-macos-arm64", using: :nounzip
        sha256 "dbbb2c51711693e5cc07cb55ef0b9ad4d464c3d14a825292668fef39c2a54bb7"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.11/codewhale-macos-x64", using: :nounzip
      sha256 "7d105d194ccdf8eb6cda0e8fe216806a5203e4cdf2e757584b3c29e354482e99"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.11/codew-macos-x64", using: :nounzip
        sha256 "7d105d194ccdf8eb6cda0e8fe216806a5203e4cdf2e757584b3c29e354482e99"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.11/codewhale-linux-arm64", using: :nounzip
      sha256 "5512dba3105f86c2e6ec0092684cb830e19147b2fcd96db6678cff78a5a5ea13"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.11/codew-linux-arm64", using: :nounzip
        sha256 "5512dba3105f86c2e6ec0092684cb830e19147b2fcd96db6678cff78a5a5ea13"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.11/codewhale-linux-x64", using: :nounzip
      sha256 "82d034dac37693fff3bfb9b80afbb00c26d7a5bddd520c3878ad3780ba696b17"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.11/codew-linux-x64", using: :nounzip
        sha256 "82d034dac37693fff3bfb9b80afbb00c26d7a5bddd520c3878ad3780ba696b17"
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
