# typed: false
# frozen_string_literal: true

# Homebrew formula for cmt - AI-Powered Git Commit Message Generator
# To install: brew tap clifton/tap && brew install cmt
class Cmt < Formula
  desc "CLI tool that generates commit messages using AI"
  homepage "https://github.com/clifton/cmt"
  version "0.5.13"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/clifton/cmt/releases/download/v#{version}/cmt-darwin-arm64"
      sha256 "f08ec600e53fee0246d46770ebbe41a91b9516ef471f07b48746acbcb73b9ba0"
    end
    on_intel do
      url "https://github.com/clifton/cmt/releases/download/v#{version}/cmt-darwin-amd64"
      sha256 "a3181c9a546fb1b9e37596c2510eadd2e68e3f8a2696bf808b38266f8d4566cb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/clifton/cmt/releases/download/v#{version}/cmt-linux-arm64"
      sha256 "d5c9ea25f46284239416b0926b2dfa473b3b187d5752a689609d1f8957da8eeb"
    end
    on_intel do
      url "https://github.com/clifton/cmt/releases/download/v#{version}/cmt-linux-amd64"
      sha256 "be85fccf2cb1ae2723d581590eda36055ed57fa47a0704f84c2f3a91a294c865"
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
