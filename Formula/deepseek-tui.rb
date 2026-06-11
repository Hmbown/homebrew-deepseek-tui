class DeepseekTui < Formula
  desc "Terminal-native coding agent for DeepSeek V4"
  homepage "https://github.com/Hmbown/CodeWhale"
  version "0.8.58"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.58/codewhale-macos-arm64", using: :nounzip
      sha256 "848beba882808e33e414289349e5e1eb0c150ac488ef23cf15e21a643d389364"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.58/codewhale-tui-macos-arm64", using: :nounzip
        sha256 "9ff06034abd7749fcdff5a053ac05e3faecf2d7ae95bca160b0d337aca019855"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.58/codewhale-macos-x64", using: :nounzip
      sha256 "a7f259296f48d7631847e42478b64226e07c289774ed95497a12f3fba0e59e6a"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.58/codewhale-tui-macos-x64", using: :nounzip
        sha256 "2a3b659a19fd3c72b40d30dc84e3596b17e37de88504bf1111c72a6e6eb81a28"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.58/codewhale-linux-arm64", using: :nounzip
      sha256 "c360c176b8cd3d1d909ef0136a97458f100803aea47054197ad62c2b29cfe5aa"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.58/codewhale-tui-linux-arm64", using: :nounzip
        sha256 "dfa686a46bf64ff69a53b3e3f50b271b4c919ef700b31e4ec1e706ce085b4972"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.58/codewhale-linux-x64", using: :nounzip
      sha256 "011f63259cc1d553547bbc9a2378e949426c5eece0bea93969678b59efcbfef0"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.58/codewhale-tui-linux-x64", using: :nounzip
        sha256 "069087bbd31b0c6b8201734d2573d36698f706b230c7b8d6b36f48df571b49a8"
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
