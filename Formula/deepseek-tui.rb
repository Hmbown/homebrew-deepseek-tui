class DeepseekTui < Formula
  desc "Terminal-native coding agent for DeepSeek V4"
  homepage "https://github.com/Hmbown/CodeWhale"
  version "0.8.45"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.45/deepseek-macos-arm64", using: :nounzip
      sha256 "b2707e8856337cb7396afc393ea6ebffc90f19b534f33073fe19909004c1ab55"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.45/deepseek-tui-macos-arm64", using: :nounzip
        sha256 "43454f103ea80ca7ef68c0f3795ada3607e3ce0b09deb39e5234ca4dc96ba24a"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.45/deepseek-macos-x64", using: :nounzip
      sha256 "4038ed69f8847288ed54e9a7a1be9b060ea4b1a1466e54904bb6399cbbf1626d"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.45/deepseek-tui-macos-x64", using: :nounzip
        sha256 "4d1756aac8ae2eb5d7f6a215f7f7905a5ee702cddde222cf98d3dd367bd2e36b"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.45/deepseek-linux-arm64", using: :nounzip
      sha256 "72ff67816129e60847cdbccd4cf6b838567579bb5c71fc505ae7665478f7ab3b"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.45/deepseek-tui-linux-arm64", using: :nounzip
        sha256 "acfc0494c6e2efe98f371eb4c9ebd98da3f71b69d91c80454d829c59f4aecb0d"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.45/deepseek-linux-x64", using: :nounzip
      sha256 "3ce0e9b129c1b652f93e9516665f3565966bd2059b276d22b94ef75bcec3debf"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.45/deepseek-tui-linux-x64", using: :nounzip
        sha256 "39deb154abe417b96a9bf1748c088a6451aca847f7bdeb0da9b6e5507273dafb"
      end
    end
  end

  def install
    bin.install Dir["*"].first => "deepseek"
    resource("tui").stage { bin.install Dir["*"].first => "deepseek-tui" }
  end

  test do
    system "#{bin}/deepseek", "--version"
  end
end
