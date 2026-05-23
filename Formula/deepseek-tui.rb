class DeepseekTui < Formula
  desc "Terminal-native coding agent for DeepSeek V4"
  homepage "https://github.com/Hmbown/CodeWhale"
  version "0.8.41"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.41/deepseek-macos-arm64", using: :nounzip
      sha256 "502968fbda7893a3a3b97ab88fe43c5da25a92fe1aaf0712a92ae7ff55ff9a4b"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.41/deepseek-tui-macos-arm64", using: :nounzip
        sha256 "3adaafbc4f944f999a161ea369928b102d446dc6704cce6bd856141bfcd7bef6"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.41/deepseek-macos-x64", using: :nounzip
      sha256 "63fc970ef5b291683fdae38b63555c6d73b9ab2fc2aecb6338bfcdbd838cd540"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.41/deepseek-tui-macos-x64", using: :nounzip
        sha256 "b854bf0db1be640662141ac6e7c2a8e1b9b1ccb63c256f3412f22d39d411ec02"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.41/deepseek-linux-arm64", using: :nounzip
      sha256 "e184d2ff7ff7f9250f099439529c426496cda9a32439869c6b83a90b0dd5880a"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.41/deepseek-tui-linux-arm64", using: :nounzip
        sha256 "2672e4043bd7af14bb7c1468917cc3bf6fd613cf22c9668344cfcec547f3278c"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.41/deepseek-linux-x64", using: :nounzip
      sha256 "9a65099789dbf923724652701641cd36f988a1136bf653ae322af74f2e06a210"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.41/deepseek-tui-linux-x64", using: :nounzip
        sha256 "aee5a3849752b20878a5559f066442f0aacc8b66928713db407214c2ae1e04af"
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
