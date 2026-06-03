class DeepseekTui < Formula
  desc "Terminal-native coding agent for DeepSeek V4"
  homepage "https://github.com/Hmbown/CodeWhale"
  version "0.8.51"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.51/codewhale-macos-arm64", using: :nounzip
      sha256 "7655176c1df1b846ff484b23e26480f4d545aecf74114930d2a4125c9d9ddb92"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.51/codewhale-tui-macos-arm64", using: :nounzip
        sha256 "4bb8205faf628939f266e8d0e2cfacf8efc7b2a0f752f7e84293c8e9d9769b82"
      end
      resource "legacy-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.51/deepseek-macos-arm64", using: :nounzip
        sha256 "b239814c9f32994fbef84d5c7d723379513d9a53881755f3c9462b822de4021f"
      end
      resource "legacy-tui-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.51/deepseek-tui-macos-arm64", using: :nounzip
        sha256 "4874408a66a8d66c32508e6f2b9c1877b3655e5de772832ec232d2bc3f209361"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.51/codewhale-macos-x64", using: :nounzip
      sha256 "bceb091bdb88f4730f722d22305d0a6c7f625a2e0c761080eea4abea87c15d16"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.51/codewhale-tui-macos-x64", using: :nounzip
        sha256 "bc2838aae3a98be79e483b159d68d331d163ef0f2641339beefdc5e3cf30bdc1"
      end
      resource "legacy-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.51/deepseek-macos-x64", using: :nounzip
        sha256 "426657ea15bdc8b0f3537e71a0af0db82e72fc1cd391dff910da60ecb62b74f1"
      end
      resource "legacy-tui-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.51/deepseek-tui-macos-x64", using: :nounzip
        sha256 "57934c896e26ef941c5310a0795b791f41ed0d141fc23ed8100c07a66ffcd4e0"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.51/codewhale-linux-arm64", using: :nounzip
      sha256 "2604fb797824856638b6720e48afe2b69ced5209b31aa1f563b6ce556492d1fa"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.51/codewhale-tui-linux-arm64", using: :nounzip
        sha256 "2b9243f34108a79bc5ca6c8a9b3a6ed18ca823f7e3a13cd7143cbe6ec1b7323d"
      end
      resource "legacy-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.51/deepseek-linux-arm64", using: :nounzip
        sha256 "139c892477371f0f9667228cbb2239fdf8b79cc73be306b71005c9e7ece5b64b"
      end
      resource "legacy-tui-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.51/deepseek-tui-linux-arm64", using: :nounzip
        sha256 "c78fd35a4a7d18170cd751d3f7306bdbdb5b93e5569ef679328c33fe3e8ab0ac"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.51/codewhale-linux-x64", using: :nounzip
      sha256 "cfd0c6d40c524aead3e01f2918c54ba197770abd57accc98aac4475fbf5a0cdb"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.51/codewhale-tui-linux-x64", using: :nounzip
        sha256 "ff7bfacfd633802d38831545b1895170185f0bbcf0e3088d574808e4be40c9df"
      end
      resource "legacy-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.51/deepseek-linux-x64", using: :nounzip
        sha256 "88e08d87b75652a84aa6d660895e049c77fd91a1fd7889281da74b1222cf9cc6"
      end
      resource "legacy-tui-shim" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.51/deepseek-tui-linux-x64", using: :nounzip
        sha256 "95ec201e5659cada3345a03bdbb597301b86abc52acbec8e1d9979684599feb5"
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
