class DeepseekTui < Formula
  desc "Agentic terminal for open-source and open-weight coding models"
  homepage "https://github.com/Hmbown/CodeWhale"
  version "0.9.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.0/codewhale-macos-arm64", using: :nounzip
      sha256 "e4596cf45e9230a9753b783ea6a7b1cce121a2037494943ca1d8623c5839e6c8"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.0/codew-macos-arm64", using: :nounzip
        sha256 "a641adad1b7f3a0488967edc142df9896d1803604ba8e9b74e2b4d8ee2ba0813"
      end
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.0/codewhale-tui-macos-arm64", using: :nounzip
        sha256 "0d23ab2a43401e616d0cb1a04debdfceb0ae61cf5f572c2f2843c8335f96c1ed"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.0/codewhale-macos-x64", using: :nounzip
      sha256 "ec2fe4d2c6520accf946df282730056e0820553159558efb7678dfc78bcdbed5"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.0/codew-macos-x64", using: :nounzip
        sha256 "8d28641d484af519e2e41a24b05a701e6442768d7b1b58f7c7e072c963485214"
      end
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.0/codewhale-tui-macos-x64", using: :nounzip
        sha256 "aa85e45f6b68099133d3bcaf4f8e496b58f1c698ae3bed9e5c7b5fa2a0c3fd01"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.0/codewhale-linux-arm64", using: :nounzip
      sha256 "ea6082245df89fb03e79696b4c7b775a73916ab2d1d4eef05c0dfa911d321f43"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.0/codew-linux-arm64", using: :nounzip
        sha256 "e68270a7d26be37bd049b6d682bcfa19cac55745d5e4b32ffdeaa0ae3683b4aa"
      end
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.0/codewhale-tui-linux-arm64", using: :nounzip
        sha256 "7b804e5557c12625dfc3b7ab96a5d7e3a1a075b742f4a9baa8d163aa2822ce5d"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.0/codewhale-linux-x64", using: :nounzip
      sha256 "a01749d4d0f4cebbf1fb62e5c9f393cb5c05b570da144176238e740552de8fca"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.0/codew-linux-x64", using: :nounzip
        sha256 "98bb0c504aacfe391f1dbf45b28ca15398413ee94ab44641f46dc0d530b8a204"
      end
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.0/codewhale-tui-linux-x64", using: :nounzip
        sha256 "08a142fc255f23e00e049416d4ea53f7fb77e026e093ebdfad16847c0906c85b"
      end
    end
  end

  def install
    bin.install Dir["*"].first => "codewhale"
    resource("codew").stage { bin.install Dir["*"].first => "codew" }
    resource("tui").stage { bin.install Dir["*"].first => "codewhale-tui" }
  end

  test do
    system "#{bin}/codewhale", "--version"
    system "#{bin}/codew", "--version"
    system "#{bin}/codewhale-tui", "--version"
  end
end
