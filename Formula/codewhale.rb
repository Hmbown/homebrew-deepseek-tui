class Codewhale < Formula
  desc "Agentic terminal for open-source and open-weight coding models"
  homepage "https://github.com/Hmbown/CodeWhale"
  version "0.9.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.10/codewhale-macos-arm64", using: :nounzip
      sha256 "3403e8bc2b128eeff1d9f150cab99ab20523252d83b6822201540bd14d06604e"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.10/codew-macos-arm64", using: :nounzip
        sha256 "3403e8bc2b128eeff1d9f150cab99ab20523252d83b6822201540bd14d06604e"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.10/codewhale-macos-x64", using: :nounzip
      sha256 "8dd44a65ab102b487197682f4a04337f7362a023a16674357544f21c7c35f7f7"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.10/codew-macos-x64", using: :nounzip
        sha256 "8dd44a65ab102b487197682f4a04337f7362a023a16674357544f21c7c35f7f7"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.10/codewhale-linux-arm64", using: :nounzip
      sha256 "23dd8dbbd8abcff4c8fe46b756b02cbfd558987e1397146470ceb09ee5c59b22"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.10/codew-linux-arm64", using: :nounzip
        sha256 "23dd8dbbd8abcff4c8fe46b756b02cbfd558987e1397146470ceb09ee5c59b22"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.10/codewhale-linux-x64", using: :nounzip
      sha256 "ed02522881d503dfa3b21dcb943c1320862c3a347ab573b170f1d82f91f1014b"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.10/codew-linux-x64", using: :nounzip
        sha256 "ed02522881d503dfa3b21dcb943c1320862c3a347ab573b170f1d82f91f1014b"
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
