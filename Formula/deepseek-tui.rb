class DeepseekTui < Formula
  desc "Terminal-native coding agent for DeepSeek V4"
  homepage "https://github.com/Hmbown/CodeWhale"
  version "0.8.49"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.49/codewhale-macos-arm64", using: :nounzip
      sha256 "918f6a49bbb33186610cde7cbe4be4955f72467e6d259a6e4471686702c0fecd"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.49/codewhale-tui-macos-arm64", using: :nounzip
        sha256 "d443ffec4c564205e721a97087caafda275ca8f90f32c6b0a02b622df0610d5f"
      end
      resource "legacy-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.49/deepseek-macos-arm64", using: :nounzip
        sha256 "660756af16bddc79fc9a2d89851d34d0c3b751614e65addf13b87fe7ad601651"
      end
      resource "legacy-tui-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.49/deepseek-tui-macos-arm64", using: :nounzip
        sha256 "1b2d881d3c62b9cf4ebc61ac7fbd619dec78aa7fcabbf9f1f83b62e606f2bdd9"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.49/codewhale-macos-x64", using: :nounzip
      sha256 "e8b660f21f67c64b760d6db0ec4fcface5a9fa8807e29d6c879e0e502867c9a2"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.49/codewhale-tui-macos-x64", using: :nounzip
        sha256 "a73a700c6d4609a04195620d9b349a91aaab1fe91099d322e9459f4a8ed32ebd"
      end
      resource "legacy-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.49/deepseek-macos-x64", using: :nounzip
        sha256 "9020d63c81468edab1843cbe6129843873e77d2b1ba465250c21d0cc3d9cca39"
      end
      resource "legacy-tui-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.49/deepseek-tui-macos-x64", using: :nounzip
        sha256 "de6e1c44eb57aee0d0cdf8bdaa819e65e5dcd720ae84ac099f961a2b7e1cc9ec"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.49/codewhale-linux-arm64", using: :nounzip
      sha256 "394fdaa93c48233be54b784098a90c9a18db5cf4bac795ac46402de46f49d745"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.49/codewhale-tui-linux-arm64", using: :nounzip
        sha256 "b4242be6999b473f701e9b7274a6e3a1318884a1689bea6a08a697e318b13fb6"
      end
      resource "legacy-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.49/deepseek-linux-arm64", using: :nounzip
        sha256 "d80d6537fe285040ea3875a57fe59155b05c3b947852c099e7d4161f4aa2bfd1"
      end
      resource "legacy-tui-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.49/deepseek-tui-linux-arm64", using: :nounzip
        sha256 "725eeca50c39c66c40e07e75eb699f0fdd92a97de20b84a538040b5943a3bbd4"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.49/codewhale-linux-x64", using: :nounzip
      sha256 "f7bce4e0bcda86ca55a9df14fd9f2b7d2eb4a0e58d50fb169f8c6d9ffacbf024"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.49/codewhale-tui-linux-x64", using: :nounzip
        sha256 "b5cfecdded68a262617d810dd44b6e12d3c117bedd072acc8a60c7ddb4226c22"
      end
      resource "legacy-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.49/deepseek-linux-x64", using: :nounzip
        sha256 "8818a4933902b4f622f14fd345cff7015cd602bba9735a0b3efabb203f391977"
      end
      resource "legacy-tui-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.49/deepseek-tui-linux-x64", using: :nounzip
        sha256 "e92a06d6ab4cbcba5cedf94fa47ffa6b55a1f6f5d7a0b026797b04d87ef65034"
      end
    end
  end

  def install
    bin.install Dir["*"].first => "codewhale"
    resource("tui").stage { bin.install Dir["*"].first => "codewhale-tui" }
    resource("legacy-shim").stage { bin.install Dir["*"].first => "deepseek" }
    resource("legacy-tui-shim").stage { bin.install Dir["*"].first => "deepseek-tui" }
  end

  test do
    system "#{bin}/codewhale", "--version"
  end
end
