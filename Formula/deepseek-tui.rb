class DeepseekTui < Formula
  desc "Terminal-native coding agent for DeepSeek V4"
  homepage "https://github.com/Hmbown/CodeWhale"
  version "0.8.52"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.52/codewhale-macos-arm64", using: :nounzip
      sha256 "915c17e414eac0f816ce6aa0f90536a3673ed52ffb2f1775d037237f3a9d87b5"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.52/codewhale-tui-macos-arm64", using: :nounzip
        sha256 "f19af02e5bbfebe7e1aaf6809181a55a274a43bbd450a6df3b79663b5d2ba473"
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
      sha256 "17fe1fe298db069928456c55c5caf4e236dec743375c8cb8ff9f72d61f867104"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.52/codewhale-tui-macos-x64", using: :nounzip
        sha256 "18561f90df4a07164cb81f944d511118f715e96483277cbc57d4f2efa9accf38"
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
      sha256 "98930829de35b68251dd2e0e81cd352fc54e454486282a0f06d715204e905f64"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.52/codewhale-tui-linux-arm64", using: :nounzip
        sha256 "69d2fe5f363ec1234802c393e31cd575f5e34e3b8b62171bfc5ca772a1add0d9"
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
      sha256 "13aeb0ef0d63288a09971363607660d22c512533111485e84c5a8a8f68e57a7e"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.52/codewhale-tui-linux-x64", using: :nounzip
        sha256 "382a9f3486fed088e1a85b396f6e5fdd7114acb0eec47e411ce3ab1087aa3585"
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
