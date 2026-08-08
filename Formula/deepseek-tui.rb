class DeepseekTui < Formula
  desc "Agentic terminal for open-source and open-weight coding models"
  homepage "https://github.com/Hmbown/CodeWhale"
  version "0.9.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.4/codewhale-macos-arm64", using: :nounzip
      sha256 "1f6aad2e303c79ff7e9b63045fc9efb2b293e5d375185bc71d65d70c521addd6"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.4/codew-macos-arm64", using: :nounzip
        sha256 "9ad3ba4de0df8c59442f524226ff046445edccee1f5c1729a2d8c023a5a277fb"
      end
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.4/codewhale-tui-macos-arm64", using: :nounzip
        sha256 "de593128eb8255f968592bde3204090335f11371fe3ddb225f92a0fe9d0f6566"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.4/codewhale-macos-x64", using: :nounzip
      sha256 "7d85823066fcd5c4843490c90271f35f83bedd639142dbe1c3e840dbac970a90"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.4/codew-macos-x64", using: :nounzip
        sha256 "3922189bc5b30281e6990a458477b225652a2d9e7311de99f33b6464c52cef05"
      end
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.4/codewhale-tui-macos-x64", using: :nounzip
        sha256 "d579df18514bb887377c943d28989b6162c3185deaa89f6c133b3f7764345de9"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.4/codewhale-linux-arm64", using: :nounzip
      sha256 "e79b25908a6557736879b6050245a0744fd5fde6d2819b68e32f0756724d357a"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.4/codew-linux-arm64", using: :nounzip
        sha256 "e68270a7d26be37bd049b6d682bcfa19cac55745d5e4b32ffdeaa0ae3683b4aa"
      end
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.4/codewhale-tui-linux-arm64", using: :nounzip
        sha256 "7367be9f6f18b2a9a6cded233d7d569919d2334fb5f03c37c80cb71f658a08a5"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.4/codewhale-linux-x64", using: :nounzip
      sha256 "d1654c674df40b1f14516a3dbf812bf743eb8bad2704f204e4f034696c115cad"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.4/codew-linux-x64", using: :nounzip
        sha256 "98bb0c504aacfe391f1dbf45b28ca15398413ee94ab44641f46dc0d530b8a204"
      end
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.4/codewhale-tui-linux-x64", using: :nounzip
        sha256 "c894674802950947acb735b5b87e7a6e1c361595fdb569cf676f8885c9d87494"
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
