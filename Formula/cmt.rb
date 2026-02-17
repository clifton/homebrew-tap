# typed: false
# frozen_string_literal: true

class Cmt < Formula
  desc "CLI tool that generates commit messages using AI"
  homepage "https://github.com/clifton/cmt"
  version "0.5.16"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/clifton/cmt/releases/download/v#{version}/cmt-darwin-arm64"
      sha256 "9dacf025ffc8b822a014a48317e5caefb61084c7b20a8a7836050191691fbf03"
    end
    on_intel do
      url "https://github.com/clifton/cmt/releases/download/v#{version}/cmt-darwin-amd64"
      sha256 "5123468cabd466a0e10ed0976b9c536036ad25eee3950a94229bc0d7cab8e455"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/clifton/cmt/releases/download/v#{version}/cmt-linux-arm64"
      sha256 "5f78006a82d7cbabbd32dd73abc3f44769a73c92fb9149a4cda0a09a09900247"
    end
    on_intel do
      url "https://github.com/clifton/cmt/releases/download/v#{version}/cmt-linux-amd64"
      sha256 "a6a0af613e4ef1a685e58d8ad2394d6e1f01aec1016c33757bfba1ae1a66bca5"
    end
  end

  def install
    binary_name = "cmt-#{OS.kernel_name.downcase}-#{Hardware::CPU.arch == :arm64 ? "arm64" : "amd64"}"
    bin.install binary_name => "cmt"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cmt --version")
  end
end
