class DeepseekTui < Formula
  desc "Terminal-native coding agent for DeepSeek V4"
  homepage "https://github.com/Hmbown/CodeWhale"
  version "0.8.66"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.66/codewhale-macos-arm64", using: :nounzip
      sha256 "6b47069fb02fccbe82cdba45eb8812579fba63478d9803074ac1fbbe96419993"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.66/codewhale-tui-macos-arm64", using: :nounzip
        sha256 "12c1760293f56d71003ac9db7adb40c20bc0f8532f467581b5cceac773df8b7f"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.66/codewhale-macos-x64", using: :nounzip
      sha256 "b2c7f1379bff05700862e25b33f8c3e181694cfccc815facd6f226b455938edb"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.66/codewhale-tui-macos-x64", using: :nounzip
        sha256 "f9d6dd6e980e077b9a3fd9f4fd0a28d4998eb86c7ef6e823f7ec656de69f7b0b"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.66/codewhale-linux-arm64", using: :nounzip
      sha256 "7f1c82ee4509cd0db1cacaa93fda45e9b4b3e8bfb992bbba32c543f08edf4bb4"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.66/codewhale-tui-linux-arm64", using: :nounzip
        sha256 "1c9b2dda13af89e23b40a9f1735ec3e1caa31b8a5698892a81dddbc5b5893d46"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.66/codewhale-linux-x64", using: :nounzip
      sha256 "f787f68f55f5e4474e47dfa8d4725f71f03f5fbc117548d597003d045982f91f"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.66/codewhale-tui-linux-x64", using: :nounzip
        sha256 "d02a0753ff4f8a7ed4ae19b2c45235d91f372af3e1ea7a6d5bc29cba5b318a8d"
      end
    end
  end

  def install
    bin.install Dir["*"].first => "codewhale"
    resource("tui").stage { bin.install Dir["*"].first => "codewhale-tui" }
  end

  test do
    system "#{bin}/codewhale", "--version"
  end
end
