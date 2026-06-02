class DeepseekTui < Formula
  desc "Terminal-native coding agent for DeepSeek V4"
  homepage "https://github.com/Hmbown/CodeWhale"
  version "0.8.50"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.50/codewhale-macos-arm64", using: :nounzip
      sha256 "3f7c124c686791bbe9a57ab9ae4bc88699ab0f4b82855c4f6cb3c699d279c781"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.50/codewhale-tui-macos-arm64", using: :nounzip
        sha256 "6cd9a15abc483737ffc7501d7efe9d5d9eda7f36ef1a14db65781fedd17e9d2e"
      end
      resource "legacy-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.50/deepseek-macos-arm64", using: :nounzip
        sha256 "e1aa19f55386d6feb526eb065b231de3b1a97a926addf49ffe6b42282641a6cd"
      end
      resource "legacy-tui-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.50/deepseek-tui-macos-arm64", using: :nounzip
        sha256 "62741fdf942e17ae03c04a9d4866376e8cdfb614667b8fc7d3e4ce2a43592c7e"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.50/codewhale-macos-x64", using: :nounzip
      sha256 "e8811f83444e75a7f8480b51a94e80e70213fdc26e91ca4c8ff3ab61fe2dd558"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.50/codewhale-tui-macos-x64", using: :nounzip
        sha256 "82ece7caf1feba7e135ac7de3373d256f329c35e908f175a2cf8c5c83dc816c3"
      end
      resource "legacy-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.50/deepseek-macos-x64", using: :nounzip
        sha256 "6aecd561646748a5b996132265fc652f023cd60b63884403bc20b9ae84217bd9"
      end
      resource "legacy-tui-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.50/deepseek-tui-macos-x64", using: :nounzip
        sha256 "1f795880d723b12a1d34e221e542395af7ea055b88cebe2e9d34c10a3d9dc386"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.50/codewhale-linux-arm64", using: :nounzip
      sha256 "6abf21de137a13c363d7d9d5bf3264708a4370f30189e60ae67b50e587143aae"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.50/codewhale-tui-linux-arm64", using: :nounzip
        sha256 "ce091b72e3d483d3079fb95a9b9f003c94551880eecfaff0e859892b30e691a5"
      end
      resource "legacy-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.50/deepseek-linux-arm64", using: :nounzip
        sha256 "edda1cea2f9f740a0c2bc941d70c601630a5a54d4ed9397d544d808a8edfe550"
      end
      resource "legacy-tui-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.50/deepseek-tui-linux-arm64", using: :nounzip
        sha256 "e991a5867cf53c875244e9485b138ce3f282851cdda3185992162e54fcc044cf"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.50/codewhale-linux-x64", using: :nounzip
      sha256 "d6f91a95e1710b2003cccdc61f2e861c39ba831d5828c2bbd707eeac51408485"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.50/codewhale-tui-linux-x64", using: :nounzip
        sha256 "1638f550ff610ad693aeb68d06a317776b87d5282874ceb3b8ca162dce47056b"
      end
      resource "legacy-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.50/deepseek-linux-x64", using: :nounzip
        sha256 "271d7144e9a4f916be997c43e816df3adff152dfdf8ceb412fe0fcf147f69667"
      end
      resource "legacy-tui-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.50/deepseek-tui-linux-x64", using: :nounzip
        sha256 "ee126ffb42a8ca5e982028ca9ee59076c595ae0c616f0b28833f397616b7b1a4"
      end
    end
  end

  def install
    bin.install Dir["*"].first => "codewhale"
    resource("tui").stage { bin.install Dir["*"].first => "codewhale-tui" }
    resource("legacy-shim").stage { bin.install Dir["*"].first => "deepseek" }
    resource("legacy-tui-shim").stage { bin.install Dir["*"].first => "deepseek-tui" }
  end

  test do
    system "#{bin}/codewhale", "--version"
  end
end
