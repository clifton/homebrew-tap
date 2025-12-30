# typed: false
# frozen_string_literal: true

# Homebrew formula for cmt - AI-Powered Git Commit Message Generator
# To install: brew tap clifton/tap && brew install cmt
class Cmt < Formula
  desc "CLI tool that generates commit messages using AI"
  homepage "https://github.com/clifton/cmt"
  version "0.5.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/clifton/cmt/releases/download/v#{version}/cmt-darwin-arm64"
      sha256 "665b12ee6ad54795c37477f2370d8f7f353db666f774ade5083c12b47f4efc31"
    end
    on_intel do
      url "https://github.com/clifton/cmt/releases/download/v#{version}/cmt-darwin-amd64"
      sha256 "a12deeb1d9f76e2b1aa08b043e9caabe7d2cd30bebad5386e9bc73c4ee38ff87"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/clifton/cmt/releases/download/v#{version}/cmt-linux-arm64"
      sha256 "2be4e69074c179f23b640b82e04e029b9c3d493c969b54fdea32c872b6ba92d2"
    end
    on_intel do
      url "https://github.com/clifton/cmt/releases/download/v#{version}/cmt-linux-amd64"
      sha256 "ad96ef67a7cdbfe0006dadcf28716d8c37b7d010574327d88a45ea47a5a149e2"
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
