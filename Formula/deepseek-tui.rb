class DeepseekTui < Formula
  desc "Terminal-native coding agent for DeepSeek V4"
  homepage "https://github.com/Hmbown/CodeWhale"
  version "0.8.62"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.62/codewhale-macos-arm64", using: :nounzip
      sha256 "a3358401096baad198857fbaee18433febfbff2d279199d9784297f73f6a7def"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.62/codewhale-tui-macos-arm64", using: :nounzip
        sha256 "0b12cb9ba526d9a9d700b51c4a9f38a11fe7513081ae1e1b2d09fa280e4a7c58"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.62/codewhale-macos-x64", using: :nounzip
      sha256 "fb03328da88a331aaf9bc453baf8953dbb51ed71d355e196cecfc50af2e6e346"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.62/codewhale-tui-macos-x64", using: :nounzip
        sha256 "37367e317ef9bba151dea772e9d4c962e272b4fb58460a6fbcdab23caf7ad0e3"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.62/codewhale-linux-arm64", using: :nounzip
      sha256 "5964aa455a8c8b22083add82d52586a413ae944c625657185d253399a060a116"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.62/codewhale-tui-linux-arm64", using: :nounzip
        sha256 "abe284a1c2c4208fcc6b5930418bedc670228e8b92c90789fb2bb5b0376de8a0"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.62/codewhale-linux-x64", using: :nounzip
      sha256 "015944529d4d643f30af53b373788f0d816e15bee77846562deca9567127d6d3"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.62/codewhale-tui-linux-x64", using: :nounzip
        sha256 "40c229d106aafd11000d578bb7fba5fa4eed763c6e5ef0f557028fff3a5fe6a0"
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
