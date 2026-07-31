class DeepseekTui < Formula
  desc "Agentic terminal for open-source and open-weight coding models"
  homepage "https://github.com/Hmbown/CodeWhale"
  version "0.9.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.3/codewhale-macos-arm64", using: :nounzip
      sha256 "50b6e13f3f1642f0e3944740f8b80ec2d89a7b4e4cea9f8c43ed26b09385cac0"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.3/codew-macos-arm64", using: :nounzip
        sha256 "028fcb9bace2c030d72b99738da5a1fc514c6f5ad0d7537d3701ac859aad4413"
      end
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.3/codewhale-tui-macos-arm64", using: :nounzip
        sha256 "55729dcc6cca64757a67ac7061f0cf825137da4f03033e42d30b0b3459c6ec30"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.3/codewhale-macos-x64", using: :nounzip
      sha256 "6e4dc61c9bbab0b7161161eb7e79c8c7937b20e2d619fbba9dffbba2727dc180"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.3/codew-macos-x64", using: :nounzip
        sha256 "a5558dea52b427c1a5603d119d116bfd16f8a6b6ff7fa7824acce02c2af2a947"
      end
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.3/codewhale-tui-macos-x64", using: :nounzip
        sha256 "69818fe3504109e175784f9ad4bbd0cdee431abca48366a2516ae80dd4a27c71"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.3/codewhale-linux-arm64", using: :nounzip
      sha256 "926f7c731eadaa80ea5f9c3dc018d0910800071cdac08a29c439d9e8ce350f8e"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.3/codew-linux-arm64", using: :nounzip
        sha256 "e68270a7d26be37bd049b6d682bcfa19cac55745d5e4b32ffdeaa0ae3683b4aa"
      end
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.3/codewhale-tui-linux-arm64", using: :nounzip
        sha256 "551fc6054f2ee8451bd7d8d8d2b4d8b2dc683a5c84921dab05dd85b5778345dc"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.3/codewhale-linux-x64", using: :nounzip
      sha256 "e012ad7a566810fd9ad96c1008b59434120fdfabb25feee8a6394f9a9133b5dc"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.3/codew-linux-x64", using: :nounzip
        sha256 "c6d572eb8aec34e9b3adaf89d23f7d6790dbe3986ca6b103ea74cfc28fbd2044"
      end
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.3/codewhale-tui-linux-x64", using: :nounzip
        sha256 "f94a4a0367b4e150101019e7e8a6d138c53c87b20885e9e4564c1202c125e75f"
      end
    end
  end

  def install
    bin.install Dir["*"].first => "codewhale"
    resource("codew").stage { bin.install Dir["*"].first => "codew" }
    resource("tui").stage { bin.install Dir["*"].first => "codewhale-tui" }
  end

  test do
    system "#{bin}/codewhale", "--version"
    system "#{bin}/codew", "--version"
    system "#{bin}/codewhale-tui", "--version"
  end
end
