class DeepseekTui < Formula
  desc "Terminal-native coding agent for DeepSeek V4"
  homepage "https://github.com/Hmbown/CodeWhale"
  version "0.8.46"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.46/codewhale-macos-arm64", using: :nounzip
      sha256 "c32fb738c9c19b0fdc5551c6c71a8172592cedbbb4179037c666a36c9198116f"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.46/codewhale-tui-macos-arm64", using: :nounzip
        sha256 "1633822a945fe379db559e8910f4a7ff1030b903e0a2958504668a1da3e25a36"
      end
      resource "legacy-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.46/deepseek-macos-arm64", using: :nounzip
        sha256 "b1391bcf0cb1a4dccba660b8c2f1962150bea565dcbe72b7575f7d91fe07810c"
      end
      resource "legacy-tui-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.46/deepseek-tui-macos-arm64", using: :nounzip
        sha256 "e765761f44a30dd3b4d00df732093be676318abed8dece4651a6c916eac336c2"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.46/codewhale-macos-x64", using: :nounzip
      sha256 "64476ad5642746bdb00e06e1aae1259e44ca88c2e821f34e98549625ca7c7b9d"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.46/codewhale-tui-macos-x64", using: :nounzip
        sha256 "76ce3e0dc120345477464fb3f06cbf7c4bf531d03547fdc5a4b20c7fc84ebc90"
      end
      resource "legacy-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.46/deepseek-macos-x64", using: :nounzip
        sha256 "2ba16f3a7e6b04f86770f2103dec1809b09608baec2c747f0334dbdf146c6010"
      end
      resource "legacy-tui-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.46/deepseek-tui-macos-x64", using: :nounzip
        sha256 "79b1607819e7067581336442891e7adf1bda12f925b231e7eb89d580274ee090"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.46/codewhale-linux-arm64", using: :nounzip
      sha256 "4069ba4523889808da7be2cead5f53d7d6fea37866498bdfe9e7a7fd28206742"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.46/codewhale-tui-linux-arm64", using: :nounzip
        sha256 "05635d2fe402ef80add6847120332c8673cd136c566dbbb8d887165cdb8bdb64"
      end
      resource "legacy-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.46/deepseek-linux-arm64", using: :nounzip
        sha256 "09354737ec2d8fcc975691b515004ee7d5d7daef76b69f17ae2dab614db72cca"
      end
      resource "legacy-tui-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.46/deepseek-tui-linux-arm64", using: :nounzip
        sha256 "978855608c28c89d7d31bfb4e3491fd120dfedcc760eb036fe98889b4b3e2d94"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.46/codewhale-linux-x64", using: :nounzip
      sha256 "1d22d8dfa0a4f8394e4cdf2e2e268a1e3a750a5eac38d1bce7929e035fa256f9"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.46/codewhale-tui-linux-x64", using: :nounzip
        sha256 "682ab027333171f364ecf588eea3e02ded5a89475e528e85202243e943ac3f16"
      end
      resource "legacy-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.46/deepseek-linux-x64", using: :nounzip
        sha256 "e7f4b5ff01c7f41ccbe65154d7435aeaf8fd05b7538eb818010ddf8029d7f6f0"
      end
      resource "legacy-tui-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.46/deepseek-tui-linux-x64", using: :nounzip
        sha256 "80cd9aadbb806b8b1b323c9b8d45ed106e780a74f50f2524dab025348b8b06b9"
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
