class DeepseekTui < Formula
  desc "Terminal-native coding agent for DeepSeek V4"
  homepage "https://github.com/Hmbown/CodeWhale"
  version "0.8.47"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.47/codewhale-macos-arm64", using: :nounzip
      sha256 "c29b7f4792126ea8aad835a97da4340d428cdc68f8677537bf57b5beed5d7bde"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.47/codewhale-tui-macos-arm64", using: :nounzip
        sha256 "8ce79986a358d77b1e0136b03e15533e65a42940d6e26bc4d15496c29fae5b40"
      end
      resource "legacy-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.47/deepseek-macos-arm64", using: :nounzip
        sha256 "0365032e074934d4474ca419ed7c87f6cfe03098512e3cb42f71a3d195c26202"
      end
      resource "legacy-tui-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.47/deepseek-tui-macos-arm64", using: :nounzip
        sha256 "bfb140a2266309519157f4f9e9f8424bba08946589c881705483f9b26b3dead6"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.47/codewhale-macos-x64", using: :nounzip
      sha256 "5c3ed49d936dd2f2949e18498d58cae795ad3a4e953bdf79c9c8db6c4343a170"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.47/codewhale-tui-macos-x64", using: :nounzip
        sha256 "10bd963404631ed5cfcb90e3adebcf1d49541f0edadb3b0d0deb3c316a73ccb8"
      end
      resource "legacy-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.47/deepseek-macos-x64", using: :nounzip
        sha256 "9881306d965235546360bc0483680badcea6bb9b46dfb68b75934df39edb3d1c"
      end
      resource "legacy-tui-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.47/deepseek-tui-macos-x64", using: :nounzip
        sha256 "926f1392bdeb8de50adf4c5bf27577061669ec651c81582e955bf0dab91f5bd7"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.47/codewhale-linux-arm64", using: :nounzip
      sha256 "9050075da0d4496b52edf237a59a21ccde8b60553cbc689e7aa5565957ebbed8"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.47/codewhale-tui-linux-arm64", using: :nounzip
        sha256 "a52990590d6f0426819fd3b95a6739922da7e519991278b9d62e2ab42a1745f5"
      end
      resource "legacy-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.47/deepseek-linux-arm64", using: :nounzip
        sha256 "cb4be56e3ae7867b805fcbb5568febd640b37395cb601e017686b014ac1fb2b1"
      end
      resource "legacy-tui-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.47/deepseek-tui-linux-arm64", using: :nounzip
        sha256 "d521c16bfda2af42929eac97d9bef801657bf349007f6fc2e06d462c9d0e99c1"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.47/codewhale-linux-x64", using: :nounzip
      sha256 "8386bc5d3f63c2dd2e29b570815546fd4f84235da56b686f4afe5d058138698f"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.47/codewhale-tui-linux-x64", using: :nounzip
        sha256 "c9fd8ca3ba0d517be25cf789b41152d8bdc746d884e8c81fd5c13fec4bb74f57"
      end
      resource "legacy-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.47/deepseek-linux-x64", using: :nounzip
        sha256 "6374819efbf9119aca100a2768a3372912b2217529faa00348577cdbd99a0003"
      end
      resource "legacy-tui-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.47/deepseek-tui-linux-x64", using: :nounzip
        sha256 "05f84b71828001988e49dfeeba5e5745cb4c662285d160cc6ed43c604b7b0049"
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
