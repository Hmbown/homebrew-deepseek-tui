class DeepseekTui < Formula
  desc "Terminal-native coding agent for DeepSeek V4"
  homepage "https://github.com/Hmbown/CodeWhale"
  version "0.8.59"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.59/codewhale-macos-arm64", using: :nounzip
      sha256 "bf577561991207a04a91721be6c3f6ec52765b411072d69e8a8a5b6ee7a40122"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.59/codewhale-tui-macos-arm64", using: :nounzip
        sha256 "b922c9870e3e32097c923e87e4d80f4c7e2db531b579317246c2caa4c721b8cb"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.59/codewhale-macos-x64", using: :nounzip
      sha256 "ac48165591fd02faefe25788dd2026eb73a9bf8ef312a35384f9db5f3a46e171"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.59/codewhale-tui-macos-x64", using: :nounzip
        sha256 "8ef9566239a682aadddc1229ee9613af70dcce22a9295551457b8c355f1e33c7"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.59/codewhale-linux-arm64", using: :nounzip
      sha256 "354ef85b184b7531fac9601d6c696f901fb4da0df69f81a3c0b82490356d6403"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.59/codewhale-tui-linux-arm64", using: :nounzip
        sha256 "8ac8e7d0a74eb0b5c8d616479e73913749c494a97ea156df0dddfa610a13d9fb"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.59/codewhale-linux-x64", using: :nounzip
      sha256 "b62fc804f65525d68bbd0d3439ebf34df70c4345c710bbce29372e978fa2060f"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.59/codewhale-tui-linux-x64", using: :nounzip
        sha256 "dcb87cd214d2306d111be087911e34deba9c32d0c0ea431d6f2bc17bbb0b41a4"
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
