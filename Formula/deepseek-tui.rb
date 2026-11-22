class DeepseekTui < Formula
  desc "Agentic terminal for open-source and open-weight coding models"
  homepage "https://github.com/codewhale-hq/CodeWhale"
  version "0.10.3"
  license "MIT"
  depends_on "node"
  deprecate! date: "2026-08-14", because: "renamed to codewhale"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/codewhale-hq/CodeWhale/releases/download/v0.10.3/codewhale-macos-arm64", using: :nounzip
      sha256 "b137c9617d5b4a18a403757e65eafcec580e6ab5b57c502b252f1f8046c90bea"
      resource "codew" do
        url "https://github.com/codewhale-hq/CodeWhale/releases/download/v0.10.3/codew-macos-arm64", using: :nounzip
        sha256 "b137c9617d5b4a18a403757e65eafcec580e6ab5b57c502b252f1f8046c90bea"
      end
    else
      url "https://github.com/codewhale-hq/CodeWhale/releases/download/v0.10.3/codewhale-macos-x64", using: :nounzip
      sha256 "2622a7b1a5268ff11c7c445209e037da7fb95ca1f2c04a94a0a4fb0a63859260"
      resource "codew" do
        url "https://github.com/codewhale-hq/CodeWhale/releases/download/v0.10.3/codew-macos-x64", using: :nounzip
        sha256 "2622a7b1a5268ff11c7c445209e037da7fb95ca1f2c04a94a0a4fb0a63859260"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/codewhale-hq/CodeWhale/releases/download/v0.10.3/codewhale-linux-arm64", using: :nounzip
      sha256 "f2f13829cd40690963a59eb207de6ca984b42d6b80be40c270aa75dd94c879b8"
      resource "codew" do
        url "https://github.com/codewhale-hq/CodeWhale/releases/download/v0.10.3/codew-linux-arm64", using: :nounzip
        sha256 "f2f13829cd40690963a59eb207de6ca984b42d6b80be40c270aa75dd94c879b8"
      end
    else
      url "https://github.com/codewhale-hq/CodeWhale/releases/download/v0.10.3/codewhale-linux-x64", using: :nounzip
      sha256 "d14edefc7edd9976fcb76fb187344287de25f8090ad2af49cfde2e7f36343e6b"
      resource "codew" do
        url "https://github.com/codewhale-hq/CodeWhale/releases/download/v0.10.3/codew-linux-x64", using: :nounzip
        sha256 "d14edefc7edd9976fcb76fb187344287de25f8090ad2af49cfde2e7f36343e6b"
      end
    end
  end

  def install
    bin.install Dir["*"].first => "codewhale"
    resource("codew").stage { bin.install Dir["*"].first => "codew" }
  end

  test do
    system "#{bin}/codewhale", "--version"
    system "#{bin}/codew", "--version"
  end
end
