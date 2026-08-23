class DeepseekTui < Formula
  desc "Agentic terminal for open-source and open-weight coding models"
  homepage "https://github.com/Hmbown/CodeWhale"
  version "0.9.11"
  license "MIT"
  deprecate! date: "2026-08-14", because: "renamed to codewhale"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.11/codewhale-macos-arm64", using: :nounzip
      sha256 "6a1082bb9a8994e547a86fab613eb47177996141d81d25b34c0e9d1ceeabd2cd"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.11/codew-macos-arm64", using: :nounzip
        sha256 "6a1082bb9a8994e547a86fab613eb47177996141d81d25b34c0e9d1ceeabd2cd"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.11/codewhale-macos-x64", using: :nounzip
      sha256 "652f02820bf642236dbf12986eb355ead16ddae916dbfd292b24d731cbdd4c12"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.11/codew-macos-x64", using: :nounzip
        sha256 "652f02820bf642236dbf12986eb355ead16ddae916dbfd292b24d731cbdd4c12"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.11/codewhale-linux-arm64", using: :nounzip
      sha256 "60a14551e994747a4f4ddb779b9c21c6d75aa3e7fdf84515543748450aa48f18"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.11/codew-linux-arm64", using: :nounzip
        sha256 "60a14551e994747a4f4ddb779b9c21c6d75aa3e7fdf84515543748450aa48f18"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.11/codewhale-linux-x64", using: :nounzip
      sha256 "c02969556e51e138afa3fe9c97a1359878cd3d1986b1ce1f5fa96c93c6909416"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.11/codew-linux-x64", using: :nounzip
        sha256 "c02969556e51e138afa3fe9c97a1359878cd3d1986b1ce1f5fa96c93c6909416"
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
