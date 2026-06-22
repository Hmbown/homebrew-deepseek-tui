class DeepseekTui < Formula
  desc "Terminal-native coding agent for DeepSeek V4"
  homepage "https://github.com/Hmbown/CodeWhale"
  version "0.8.64"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.64/codewhale-macos-arm64", using: :nounzip
      sha256 "4d562270131af71cc002ca29cd86038cd7b5faa23cea721e9f615693d65cfb25"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.64/codewhale-tui-macos-arm64", using: :nounzip
        sha256 "6dffc5f3a723c4c8dd33b6b91aedd40372193fc919c16c73021bbd61bf447fc2"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.64/codewhale-macos-x64", using: :nounzip
      sha256 "7cf56ae4574503e874d82bcc662c41e60af7db17e8c2e0aa68699cb4912e4e35"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.64/codewhale-tui-macos-x64", using: :nounzip
        sha256 "8cbbf4e4f085fcfdf5700aecac1b847f97aa47a6c60e0f0dce19bb4ae04a3d2e"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.64/codewhale-linux-arm64", using: :nounzip
      sha256 "818a1f08b1d0d8341be7851f4ffb46d29d85138d42599f05ef56fae684063639"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.64/codewhale-tui-linux-arm64", using: :nounzip
        sha256 "09229a361ac918e9f7816ee07b41ae34d782b382c57246b117aea907b6f6e383"
      end
    else
      url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.64/codewhale-linux-x64", using: :nounzip
      sha256 "b0abc99bac494832198cdee25ecab904c6b2ec09b89a2be1cd6998a2ba60ed76"
      resource "tui" do
        url "https://github.com/Hmbown/CodeWhale/releases/download/v0.8.64/codewhale-tui-linux-x64", using: :nounzip
        sha256 "437c11439104a5059987c8055a17748e34405538b3fe80ed55529067a1f42643"
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
