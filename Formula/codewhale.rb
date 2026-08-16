class Codewhale < Formula
  desc "Agentic terminal for open-source and open-weight coding models"
  homepage "https://github.com/Hmbown/CodeWhale"
  version "0.9.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.8/codewhale-macos-arm64", using: :nounzip
      sha256 "d30b5a8750c13f60cab61455345903d072d0884282953adb77ade1687953159a"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.8/codew-macos-arm64", using: :nounzip
        sha256 "d30b5a8750c13f60cab61455345903d072d0884282953adb77ade1687953159a"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.8/codewhale-macos-x64", using: :nounzip
      sha256 "bcab655e2d4acbfc9cafb3a29ac1345a41cc799e5e87f05b4272353efc08f57f"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.8/codew-macos-x64", using: :nounzip
        sha256 "bcab655e2d4acbfc9cafb3a29ac1345a41cc799e5e87f05b4272353efc08f57f"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.8/codewhale-linux-arm64", using: :nounzip
      sha256 "3faef9fbe8da1e50613661ece9cfd7d72a2d3cbc5cf60f197f26ac623d70327c"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.8/codew-linux-arm64", using: :nounzip
        sha256 "3faef9fbe8da1e50613661ece9cfd7d72a2d3cbc5cf60f197f26ac623d70327c"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.8/codewhale-linux-x64", using: :nounzip
      sha256 "faba3029e1c4f2127aeae6dbaf0f4f33f32226370255a2906f2d0fa0d7e1b5e1"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.8/codew-linux-x64", using: :nounzip
        sha256 "faba3029e1c4f2127aeae6dbaf0f4f33f32226370255a2906f2d0fa0d7e1b5e1"
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
