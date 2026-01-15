# typed: false
# frozen_string_literal: true

# Homebrew formula for cmt - AI-Powered Git Commit Message Generator
# To install: brew tap clifton/tap && brew install cmt
class Cmt < Formula
  desc "CLI tool that generates commit messages using AI"
  homepage "https://github.com/clifton/cmt"
  version "0.5.14"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/clifton/cmt/releases/download/v#{version}/cmt-darwin-arm64"
      sha256 "85a2bab8dfd59613d483e1b249de35efc2fbb08f105084d6e789224f7b00c995"
    end
    on_intel do
      url "https://github.com/clifton/cmt/releases/download/v#{version}/cmt-darwin-amd64"
      sha256 "5baf79361bbf48b832e0eca7f1e95ff203e541af6e234d8582fc2f840c4c4da3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/clifton/cmt/releases/download/v#{version}/cmt-linux-arm64"
      sha256 "14b6cb05f91967244dd10a6d6a81c6eebd4907772d37246a0f3db606e4224c98"
    end
    on_intel do
      url "https://github.com/clifton/cmt/releases/download/v#{version}/cmt-linux-amd64"
      sha256 "6ca5ebeb539e9e756ac4b3f04ce0ddb0e5533bd358617616f377f607d636fd0e"
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
