class DeepseekTui < Formula
  desc "Terminal-native coding agent for DeepSeek V4"
  homepage "https://github.com/Hmbown/CodeWhale"
  version "0.8.55"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.55/codewhale-macos-arm64", using: :nounzip
      sha256 "cad29d33c3ed582b02eccffe54075b85e9bed843716e3f40293740e7ffbb7595"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.55/codewhale-tui-macos-arm64", using: :nounzip
        sha256 "5576c0abfd456dbbfb05d2db4fad992942fd232e5b1de5779ead5affb87a4858"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.55/codewhale-macos-x64", using: :nounzip
      sha256 "03dc844b5aad3c75463d02a2bb4f68954ca064f6bcc293b644e4193bfb063540"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.55/codewhale-tui-macos-x64", using: :nounzip
        sha256 "381646773d4a3fb6e3bd13fc252fceaba3f6ec3a29ac8d9d796d1cddcda07749"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.55/codewhale-linux-arm64", using: :nounzip
      sha256 "17c8526ec3875e7c4c8ceed3cb735b8acec3e497c11455d46a20c8426f9dada0"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.55/codewhale-tui-linux-arm64", using: :nounzip
        sha256 "3bda0e184c71bc280284e1d8ed33bc556957e31ce38d13c0200433f899270dbc"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.55/codewhale-linux-x64", using: :nounzip
      sha256 "8f09f7aca0dd6bb9dfb5a34ba8c5cd83eb6389cb21382e2cd7b4ad7d2c93b845"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.55/codewhale-tui-linux-x64", using: :nounzip
        sha256 "d42c687eef7ce91d61c7503544d2eabd11ab985218be244891d3bfa70f8b225f"
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
