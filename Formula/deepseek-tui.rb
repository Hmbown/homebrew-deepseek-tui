class DeepseekTui < Formula
  desc "Terminal-native coding agent for DeepSeek V4"
  homepage "https://github.com/Hmbown/DeepSeek-TUI"
  version "0.8.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.17/deepseek-macos-arm64"
      sha256 "472c748f3741ee894a267898dceac9df28b35b4ee5b23258ac606bc7233a90b3"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.17/deepseek-tui-macos-arm64"
        sha256 "6e6bcf577f7d4a7beb3685ef8eb4694a08f9689cb06c5f353bc6c536da495474"
      end
    else
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.17/deepseek-macos-x64"
      sha256 "160a98eeb7451d458ae3d490a98b9e1c4d08f01262f3b5c86d13d7c76442fb60"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.17/deepseek-tui-macos-x64"
        sha256 "b5fd52bff7e84a98e2d7aea9bd343d3874697e49c9b71ea352580a36819227ff"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.17/deepseek-linux-arm64"
      sha256 "dd9c0556aa6e69b79e8e295dbccc1576a75beb470e91eaaea4e1194e5bcb65d8"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.17/deepseek-tui-linux-arm64"
        sha256 "ad7439207c8c136dd7ee41adad39ae9453b08bc6301f7f388c4476df0bef46ee"
      end
    else
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.17/deepseek-linux-x64"
      sha256 "d71cfebaf3098a23aef1f89d6d97ca08bf62163524cbcf3fae023a7a8ce33c68"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.17/deepseek-tui-linux-x64"
        sha256 "c78becc010dd46bd09ceb162c905e471ff71575a7733a854580543b9598a3232"
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
