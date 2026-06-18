class DeepseekTui < Formula
  desc "Terminal-native coding agent for DeepSeek V4"
  homepage "https://github.com/Hmbown/CodeWhale"
  version "0.8.62"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.62/codewhale-macos-arm64", using: :nounzip
      sha256 "8876d4db01fc0312e6b88d62ff34eff6dc3df3106746024e1d1f78e29be8418f"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.62/codewhale-tui-macos-arm64", using: :nounzip
        sha256 "d0e478fd10f51feac199881076b5c4d26d22ea318c9a7a7e9efafb2886cec54b"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.62/codewhale-macos-x64", using: :nounzip
      sha256 "504833a44b963be3bd2de9aa8014ae7d8c388a772f2b2fe40ea89277266da2c2"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.62/codewhale-tui-macos-x64", using: :nounzip
        sha256 "a78cd0afe0259e074f6e52966a4dbf4a1c6ffa645de31e52102cba2030fb8979"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.62/codewhale-linux-arm64", using: :nounzip
      sha256 "46e301c0d9837983acc463580ba15f7c90988d8bbdf1a5812f1cb1f301187c0a"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.62/codewhale-tui-linux-arm64", using: :nounzip
        sha256 "d4043313ffeb5267639237faaca8b986aa90a8fbca4f30a039468101de8ca5f4"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.62/codewhale-linux-x64", using: :nounzip
      sha256 "722dcca24196a320effc5d12cabdd51fe1966aaf5436a4d0b3464ecabb885761"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.62/codewhale-tui-linux-x64", using: :nounzip
        sha256 "9b0c28d19c0fc1c23a27f444f65f1f20f4e64bcf8dc75de27bb3faf6c61765f4"
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
