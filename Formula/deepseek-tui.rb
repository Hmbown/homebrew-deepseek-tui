class DeepseekTui < Formula
  desc "Terminal-native coding agent for DeepSeek V4"
  homepage "https://github.com/Hmbown/CodeWhale"
  version "0.8.52"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.52/codewhale-macos-arm64", using: :nounzip
      sha256 "438bbda0a7e398f2b5cdb4c7bb5d1bed645d6429b959e24e0981be0e7b2f64e5"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.52/codewhale-tui-macos-arm64", using: :nounzip
        sha256 "1c1767254a4997365df5ff6801081e95197a70680ba8a3603b5fa70bf77231ad"
      end
      resource "legacy-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.52/deepseek-macos-arm64", using: :nounzip
        sha256 "029872ef4cd3a5961f2323da9704d4ad44902ab02d9b5499befd98ce77262128"
      end
      resource "legacy-tui-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.52/deepseek-tui-macos-arm64", using: :nounzip
        sha256 "87aefe42b33c9a0b0d85a1836e968f8bdc15fa758bbb1c2617db248ae97513f1"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.52/codewhale-macos-x64", using: :nounzip
      sha256 "d2ada816c11f9e97a065e66bf9154e6f9537ddfaa60868113c16f66906a4d8e4"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.52/codewhale-tui-macos-x64", using: :nounzip
        sha256 "2f51a45490fd4be2a52cd83451fd447daab852e9ad0777190afa03450e5c989b"
      end
      resource "legacy-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.52/deepseek-macos-x64", using: :nounzip
        sha256 "315d1e6444266cd754803a162fac83948df30cf76299df75a4a96386cc081734"
      end
      resource "legacy-tui-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.52/deepseek-tui-macos-x64", using: :nounzip
        sha256 "643e0c807c3202df5303028ee69033ebe0f080c00c35fd1cb21cdeafa7e94239"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.52/codewhale-linux-arm64", using: :nounzip
      sha256 "1b610e746cc80c6b8caf3e62d3893fc8a6e7fcb98a05d95ae6b0b839bfe28bb0"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.52/codewhale-tui-linux-arm64", using: :nounzip
        sha256 "e92e27824b17cb699deacddd97873318100153d2264980751d5993bf848f8069"
      end
      resource "legacy-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.52/deepseek-linux-arm64", using: :nounzip
        sha256 "897f9cc748a1d32c14fb6afd9cd18330a1a85a3da9d8d67521e1c773899e895d"
      end
      resource "legacy-tui-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.52/deepseek-tui-linux-arm64", using: :nounzip
        sha256 "1b805ea775aa9b6318a3a7903204fb4f2ce7e5fd0c452c79f404cd86d361e35c"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.52/codewhale-linux-x64", using: :nounzip
      sha256 "9f47132906c588edc2365352c6be30b0c2ffdb8bf384e3ce08714c146c1dfc33"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.52/codewhale-tui-linux-x64", using: :nounzip
        sha256 "69a33be33bb1cad09cc67d0a564e1766e364fbd01bf1bb78bd8d4c6e5e8ebb22"
      end
      resource "legacy-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.52/deepseek-linux-x64", using: :nounzip
        sha256 "1f6ee66155c0fb9a51e0b9e3a4777426489e22bf9dc9726918b2145685b01e4c"
      end
      resource "legacy-tui-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.52/deepseek-tui-linux-x64", using: :nounzip
        sha256 "a586e72b49d74e209132b78a5c3250063fe13beb61984139d3dc92a484191932"
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
