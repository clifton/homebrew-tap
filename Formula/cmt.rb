# typed: false
# frozen_string_literal: true

class Cmt < Formula
  desc "CLI tool that generates commit messages using AI"
  homepage "https://github.com/clifton/cmt"
  version "0.5.15"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/clifton/cmt/releases/download/v#{version}/cmt-darwin-arm64"
      sha256 "f8bfd9f5b4e0274d39d8c62158f2e7ff4aaf85e2ef8e0b1eff8b07d551724735"
    end
    on_intel do
      url "https://github.com/clifton/cmt/releases/download/v#{version}/cmt-darwin-amd64"
      sha256 "302c790ee0fa0131fab98a326571f5eafc418951ec18ded5289cfba8f8db16a5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/clifton/cmt/releases/download/v#{version}/cmt-linux-arm64"
      sha256 "42c925af2f4638efb7c3408e3151fe5e085b2e1e933cc8a1ec00749ed07b48b3"
    end
    on_intel do
      url "https://github.com/clifton/cmt/releases/download/v#{version}/cmt-linux-amd64"
      sha256 "14809bd26c92207b468a716956060956a1f20304601e90de4c21d55bbe4d8768"
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
