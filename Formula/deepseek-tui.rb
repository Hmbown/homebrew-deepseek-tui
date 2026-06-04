class DeepseekTui < Formula
  desc "Terminal-native coding agent for DeepSeek V4"
  homepage "https://github.com/Hmbown/CodeWhale"
  version "0.8.53"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.53/codewhale-macos-arm64", using: :nounzip
      sha256 "2609a3e6f8265266b05e3f1c3d9c21b108aed245fbe0293939ad846be3cc54a5"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.53/codewhale-tui-macos-arm64", using: :nounzip
        sha256 "20959ea46a7d99307ebc248c4c38c5b1f52ba8426668eeeba06fe19100ce978a"
      end
      resource "legacy-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.53/deepseek-macos-arm64", using: :nounzip
        sha256 "0a6375bad3e315866151f720d34bd27748f2d50d56176b927d11824a5cb267ae"
      end
      resource "legacy-tui-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.53/deepseek-tui-macos-arm64", using: :nounzip
        sha256 "2126d925cc4c5947de7d8240ebb7724ae0e475779f12c31a5214b49b4956625d"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.53/codewhale-macos-x64", using: :nounzip
      sha256 "e98b6e5d7c1a1c527a86e5a577d40cc93a6371956f7a25b74b98b69804ea2fac"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.53/codewhale-tui-macos-x64", using: :nounzip
        sha256 "984945eeaafe6c9ab807e48c61ea767351a747b887ef862e0375faa75f87377e"
      end
      resource "legacy-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.53/deepseek-macos-x64", using: :nounzip
        sha256 "450fdd98235a8781dca504152bf39edc66a564ad46c8192c096a742436c16364"
      end
      resource "legacy-tui-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.53/deepseek-tui-macos-x64", using: :nounzip
        sha256 "f09c6c2d03fd8bd7c7849a9502e73f4ad714963f4c5858905a857b582a2c749d"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.53/codewhale-linux-arm64", using: :nounzip
      sha256 "a98fdc00ebff200d3ca2e2a678409a13e5ce8b9fb0d830eadc9adc6c807391db"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.53/codewhale-tui-linux-arm64", using: :nounzip
        sha256 "ddaf3321ab51b33a8c9fd9e5186067fe6cd9ecb7c489f4696ccc31ea1906054c"
      end
      resource "legacy-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.53/deepseek-linux-arm64", using: :nounzip
        sha256 "c6f4d2510e2fbee41be0247d458f9703088a1a64e2fb99adc530b17e1aa2b8d7"
      end
      resource "legacy-tui-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.53/deepseek-tui-linux-arm64", using: :nounzip
        sha256 "74256d81cf8da3bb76c03953dc0b7ce53119439ab5c9252f4da15d2b184d8f5a"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.53/codewhale-linux-x64", using: :nounzip
      sha256 "57104d1f6a38884924d0fae7b991c33c40a3be6f8045747d4ff055f10aaf62dc"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.53/codewhale-tui-linux-x64", using: :nounzip
        sha256 "0c189693873840587f04a3e51b96b72a41f4653c4d420a99ec85b01f839a104c"
      end
      resource "legacy-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.53/deepseek-linux-x64", using: :nounzip
        sha256 "829a4c926af47084df814e5d99fabb06e99938af8fbfb3a6601de3c8da357573"
      end
      resource "legacy-tui-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.53/deepseek-tui-linux-x64", using: :nounzip
        sha256 "70ba8fd94d02b862335b03e577eb327e3ff1535f3528fad9a926f7370a3b6fad"
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
