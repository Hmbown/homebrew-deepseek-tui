class DeepseekTui < Formula
  desc "Terminal-native coding agent for DeepSeek V4"
  homepage "https://github.com/Hmbown/CodeWhale"
  version "0.8.43"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.43/deepseek-macos-arm64", using: :nounzip
      sha256 "78c366fc56b9ed3f27039ae700084daa610df1af250e780182f007560b375c8c"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.43/deepseek-tui-macos-arm64", using: :nounzip
        sha256 "09c4a69cda05e93c277cf26ffc6fe0e1b6ba3b9da9f8d151406c0d27bd3d4970"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.43/deepseek-macos-x64", using: :nounzip
      sha256 "b80df60bebbf7b38b2c0da98e8eb57d194b5c3fe7aa705a40ca21c17e3ed7408"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.43/deepseek-tui-macos-x64", using: :nounzip
        sha256 "9ed76f198719b6d5bc07364936a23d0edb0525648f5b194f08c885d61191d2b6"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.43/deepseek-linux-arm64", using: :nounzip
      sha256 "d68b935e32830a8fca1f8d218e8f3dfa4885fb636742731453f08f48bfc8c4db"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.43/deepseek-tui-linux-arm64", using: :nounzip
        sha256 "e4e740cb1c645a43bb56f1c6e5a3c9804cb0f1cdcdbeffebbe3d5051a73fd29f"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.43/deepseek-linux-x64", using: :nounzip
      sha256 "19035914faba0316dfc5b9f9c8b2a7b0dd5a9411d2059378f9037ae103d24482"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.43/deepseek-tui-linux-x64", using: :nounzip
        sha256 "8e0d744d4f588622bfcaf23625ecde25a9d788198de88d97b3c91062c1ac2693"
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
