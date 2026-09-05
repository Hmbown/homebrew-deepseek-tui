class DeepseekTui < Formula
  desc "Agentic terminal for open-source and open-weight coding models"
  homepage "https://github.com/Hmbown/CodeWhale"
  version "0.9.12"
  license "MIT"
  deprecate! date: "2026-08-14", because: "renamed to codewhale"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.12/codewhale-macos-arm64", using: :nounzip
      sha256 "68b22dca80bffb13ba97a10794a4d54206cf1abc0a6a9df2e499ce2057ccb724"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.12/codew-macos-arm64", using: :nounzip
        sha256 "68b22dca80bffb13ba97a10794a4d54206cf1abc0a6a9df2e499ce2057ccb724"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.12/codewhale-macos-x64", using: :nounzip
      sha256 "96424a533be04ae14ec2eeecfe1eb7d56a6b0fe36b5be01eeb3e6c4f1e89bee2"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.12/codew-macos-x64", using: :nounzip
        sha256 "96424a533be04ae14ec2eeecfe1eb7d56a6b0fe36b5be01eeb3e6c4f1e89bee2"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.12/codewhale-linux-arm64", using: :nounzip
      sha256 "1a48def4032e88d808471c6feaa5a6c902fb584c085cc758cc1d297d38dbda13"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.12/codew-linux-arm64", using: :nounzip
        sha256 "1a48def4032e88d808471c6feaa5a6c902fb584c085cc758cc1d297d38dbda13"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.12/codewhale-linux-x64", using: :nounzip
      sha256 "9d0b74d8d3bf1021f9e8ca502650b76d2172e7fb9dd6d475a7e43ba7c730e7f1"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.12/codew-linux-x64", using: :nounzip
        sha256 "9d0b74d8d3bf1021f9e8ca502650b76d2172e7fb9dd6d475a7e43ba7c730e7f1"
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
