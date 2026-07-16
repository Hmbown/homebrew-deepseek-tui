class DeepseekTui < Formula
  desc "Agentic terminal for open-source and open-weight coding models"
  homepage "https://github.com/Hmbown/CodeWhale"
  version "0.9.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.0/codewhale-macos-arm64", using: :nounzip
      sha256 "a19d5b15d95077f4905d2faa9e095bc095e54172900a983c09b09218f48f53aa"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.0/codew-macos-arm64", using: :nounzip
        sha256 "a641adad1b7f3a0488967edc142df9896d1803604ba8e9b74e2b4d8ee2ba0813"
      end
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.0/codewhale-tui-macos-arm64", using: :nounzip
        sha256 "37197a00fd602e63aaefc027d770ab5e56bab66a27c7a38a3dd26d5ef108ea8b"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.0/codewhale-macos-x64", using: :nounzip
      sha256 "f8a4ea7c45d26a07b9725c15f60f4dbb4238ab30ad687265c1160662a871a474"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.0/codew-macos-x64", using: :nounzip
        sha256 "8d28641d484af519e2e41a24b05a701e6442768d7b1b58f7c7e072c963485214"
      end
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.0/codewhale-tui-macos-x64", using: :nounzip
        sha256 "b174f879ba4f02dae45fa7715c7976061d1417014717f4631f4846eb83a4b095"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.0/codewhale-linux-arm64", using: :nounzip
      sha256 "9232bfb3d4b84571137b6bdcf256a45522df31a48a32658ef920cd7abd361b13"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.0/codew-linux-arm64", using: :nounzip
        sha256 "e68270a7d26be37bd049b6d682bcfa19cac55745d5e4b32ffdeaa0ae3683b4aa"
      end
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.0/codewhale-tui-linux-arm64", using: :nounzip
        sha256 "b8b41b730cb18cf909fd8732d6c649048e86c041a2bf5ce8c627476d3cbe6b59"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.0/codewhale-linux-x64", using: :nounzip
      sha256 "cf7958e1083025c1e61a5b8abc7bc2743c94203c9086c0efb6cee5913758e9c5"
      resource "codew" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.0/codew-linux-x64", using: :nounzip
        sha256 "98bb0c504aacfe391f1dbf45b28ca15398413ee94ab44641f46dc0d530b8a204"
      end
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.9.0/codewhale-tui-linux-x64", using: :nounzip
        sha256 "60427250a27c4d4ead593a1d6a4647c86fbc67c8e8534271a707fbdcfa40a43b"
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
