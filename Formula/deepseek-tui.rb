class DeepseekTui < Formula
  desc "Agentic terminal for open-source and open-weight coding models"
  homepage "https://github.com/Hmbown/CodeWhale"
  version "0.9.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.2/codewhale-macos-arm64", using: :nounzip
      sha256 "dcb6fbe81993ae57d2e0f06c25e2ce8252d3f87e5aab311de7413af893be5b6c"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.2/codew-macos-arm64", using: :nounzip
        sha256 "107925aee338a7702b8a72fc8c1b7f9d8372e1e081c19cd590ee6d8febd3d026"
      end
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.2/codewhale-tui-macos-arm64", using: :nounzip
        sha256 "95de564f0c7c67b3c6fc01a8a06b007c266ca43a74806c91e2cf3850cec2a9de"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.2/codewhale-macos-x64", using: :nounzip
      sha256 "fe5714b56e073c1914a05db72f676ef0367e19e22e106c4ca5caa5fdc0d2cce1"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.2/codew-macos-x64", using: :nounzip
        sha256 "90f8dfa091891ec57ba1002eedd278ae5294240c33f63150d000de94c0aedd34"
      end
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.2/codewhale-tui-macos-x64", using: :nounzip
        sha256 "94d0353f147b80594c985b113cd371b5b8dd33e87bc70b9b2db71105f5d5ea56"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.2/codewhale-linux-arm64", using: :nounzip
      sha256 "caedb1a28ca232d584431958313785f3fd5e0472e2512778114d29554ec239ff"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.2/codew-linux-arm64", using: :nounzip
        sha256 "c3b0ab8d9f24c01397173692dd2b2e8aae4e21003d4f0d8ee6d7ca50960604c2"
      end
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.2/codewhale-tui-linux-arm64", using: :nounzip
        sha256 "636230b73983726e80656514387be087760aad60a3635e596b2c5f0c1761e622"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.2/codewhale-linux-x64", using: :nounzip
      sha256 "43ca1ceb477f8208b3a45698258e227879f546855269fef946aeeb356ccc6b26"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.2/codew-linux-x64", using: :nounzip
        sha256 "98bb0c504aacfe391f1dbf45b28ca15398413ee94ab44641f46dc0d530b8a204"
      end
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.2/codewhale-tui-linux-x64", using: :nounzip
        sha256 "e498c4f7dc8040c2d8bde84e92528e771fc70e88ce38ef157963d5c1b197f573"
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
