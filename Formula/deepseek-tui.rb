class DeepseekTui < Formula
  desc "Terminal-native coding agent for DeepSeek V4"
  homepage "https://github.com/Hmbown/DeepSeek-TUI"
  version "0.8.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.14/deepseek-macos-arm64"
      sha256 "6a236cc3791b4f16ab1d4ed81e2ea9487450af9171d005d66c85691166271556"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.14/deepseek-tui-macos-arm64"
        sha256 "838592ac334a65358469bb45ca88be4273f915738b5e5eee3fad9ccfb2872791"
      end
    else
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.14/deepseek-macos-x64"
      sha256 "0a248ddf31a06f7ac715cd25a0d8e600111ee0881d5b5098a4b2db46f182a4f5"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.14/deepseek-tui-macos-x64"
        sha256 "c3a6df1857f40aefdf0b95552abb4b30e97e49f3f03ac7d1e965b4d10661db09"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.14/deepseek-linux-arm64"
      sha256 "5c0b3b7a1c4d62cf87c647dbef1c66d20d6414f6505d9037195044edf025791a"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.14/deepseek-tui-linux-arm64"
        sha256 "44f4e5e49e1db491ade8f288eb2e663e46228f16a051ebd511f8d19c64a206d3"
      end
    else
      url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.14/deepseek-linux-x64"
      sha256 "99cf3ddc81b5da4a2b4d964a7ca3cab4c0676505dece42a826ecf02bad7bfd09"
      resource "tui" do
        url "https://github.com/Hmbown/DeepSeek-TUI/releases/download/v0.8.14/deepseek-tui-linux-x64"
        sha256 "0c62563fc43adacd9b36ee505551ed5cbe557b8dc9fe2194a05691be80a76262"
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
