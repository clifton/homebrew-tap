# typed: false
# frozen_string_literal: true

# Homebrew formula for cmt - AI-Powered Git Commit Message Generator
# To install: brew tap clifton/tap && brew install cmt
class Cmt < Formula
  desc "CLI tool that generates commit messages using AI"
  homepage "https://github.com/clifton/cmt"
  version "0.5.12"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/clifton/cmt/releases/download/v#{version}/cmt-darwin-arm64"
      sha256 "76a0bfc48b7ccb99a0168f1c85e02be8ea910a05cdb572524e18a21bf11a33f7"
    end
    on_intel do
      url "https://github.com/clifton/cmt/releases/download/v#{version}/cmt-darwin-amd64"
      sha256 "bb75a722a9e51eab01fc16cac0a0877cde4fe1667edb8d88852bdd8d81d5ebd0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/clifton/cmt/releases/download/v#{version}/cmt-linux-arm64"
      sha256 "c7be56cf02d58464d1b95c5610ae9f36c87fbea4582845a726ba231358eec6f9"
    end
    on_intel do
      url "https://github.com/clifton/cmt/releases/download/v#{version}/cmt-linux-amd64"
      sha256 "d6fd3b6381c7f21359d37c2e573004a79f25000a20baf80c626f982cae70c36f"
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
