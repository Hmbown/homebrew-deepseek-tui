class DeepseekTui < Formula
  desc "Terminal-native coding agent for DeepSeek V4"
  homepage "https://github.com/Hmbown/CodeWhale"
  version "0.8.48"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.48/codewhale-macos-arm64", using: :nounzip
      sha256 "c3bfc951181f2432d66a242ecf8a7ad74402f6dd80a570863cc84f5e7a372607"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.48/codewhale-tui-macos-arm64", using: :nounzip
        sha256 "15e534493e017ec439647177110a0fbe89ef34d518d8b91f3381abdca5cab286"
      end
      resource "legacy-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.48/deepseek-macos-arm64", using: :nounzip
        sha256 "c00fe3f679ea0313ad8255e806b40676fecf02eb34072862725a793f18859611"
      end
      resource "legacy-tui-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.48/deepseek-tui-macos-arm64", using: :nounzip
        sha256 "14f3caf8c308fac0836add0b09c066c7377f2bd2f833e37010376aa9edd9fdf2"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.48/codewhale-macos-x64", using: :nounzip
      sha256 "dbfdbf5acb99b2c3dae45c5f6372c0a56d8ae67cd7214f2048263f681cdbbb6c"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.48/codewhale-tui-macos-x64", using: :nounzip
        sha256 "b775273d2bf6e1762df6c6d43d50d15222da888d2575fa7713a7af272d861542"
      end
      resource "legacy-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.48/deepseek-macos-x64", using: :nounzip
        sha256 "b63c64cffd3ccbe4c3cf587e0bad4c4f386cd6aea975795af458929dd632a8c0"
      end
      resource "legacy-tui-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.48/deepseek-tui-macos-x64", using: :nounzip
        sha256 "a8a095c5aefa836da25b073ea16c3313ba0f5efb8c6ba70fe5076cc8a7f5c774"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.48/codewhale-linux-arm64", using: :nounzip
      sha256 "0506302fc2f58d33d5ca170d7dc624018c6a4eeb37691b2fa8d2c7047e596d38"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.48/codewhale-tui-linux-arm64", using: :nounzip
        sha256 "f418aa1fb7ae0a7799066f0bbd4753007d09c9f9d1645eddf466e2214babbd9c"
      end
      resource "legacy-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.48/deepseek-linux-arm64", using: :nounzip
        sha256 "5135d16f104cdb5cb37f0d898959657706a29b8e01acc34f438a5969396bc32d"
      end
      resource "legacy-tui-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.48/deepseek-tui-linux-arm64", using: :nounzip
        sha256 "d788a097a057b892f15c728d0da1cfe15d20d440ec2576a0c47695fd80a5e1fa"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.48/codewhale-linux-x64", using: :nounzip
      sha256 "3ff5f9b4dee908c1aad37931d347c6bc4992e428d1dadd9941c247b3e9230443"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.48/codewhale-tui-linux-x64", using: :nounzip
        sha256 "284f2c314ad4d12135aa4feb2dd204e057ed84a5d01cd2a79b27e67b3f9198f0"
      end
      resource "legacy-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.48/deepseek-linux-x64", using: :nounzip
        sha256 "b38b8c5e8daada0551d7e48c144a6ce8834164f38c8de07f3ff36948f6905fae"
      end
      resource "legacy-tui-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.48/deepseek-tui-linux-x64", using: :nounzip
        sha256 "76b33a484d4b9e43e4ba4521464ac991a8ab623c7b8ffc39eb48ecc2706874c5"
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
